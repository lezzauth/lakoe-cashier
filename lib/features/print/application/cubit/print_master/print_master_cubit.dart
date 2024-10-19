import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:point_of_sales_cashier/features/print/application/cubit/print_master/print_master_state.dart';
import 'package:point_of_sales_cashier/utils/helpers/bluetooth_permission.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class PrintMasterCubit extends Cubit<PrintMasterState> {
  StreamSubscription<BluetoothDiscoveryResult>? _discoveryStreamSubscription;
  final Set<String> _connectedDeviceAddresses = {}; // Storing connected devices
  List<BluetoothDiscoveryResult> _discoveredDevices = [];

  PrintMasterCubit() : super(PrintMasterInitial());

  // Check Bluetooth permission and whether Bluetooth is enabled
  Future<void> init() async {
    try {
      final permissions = await TBluetoothPermission.checkPermissions();
      bool isPermissionsAllowed = ![
        permissions.bluetoothConnect,
        permissions.bluetoothScan,
        permissions.nearbyDevices
      ].contains(true);

      if (!isPermissionsAllowed) {
        return emit(PrintMasterPermissionDenied(
          bluetoothConnect: permissions.bluetoothConnect,
          bluetoothScan: permissions.bluetoothScan,
          nearbyDevices: permissions.nearbyDevices,
        ));
      }

      if (!await _isBluetoothEnabled()) {
        emit(PrintMasterBluetoothDisabled());
        return;
      }
    } catch (e) {
      emit(PrintMasterLoadFailure(e.toString()));
    }
  }

  // Start the process of discovering Bluetooth devices
  Future<void> startDeviceDiscovery() async {
    log('Starting Bluetooth device discovery');

    if (!await _isBluetoothEnabled()) {
      emit(PrintMasterBluetoothDisabled());
      return;
    }

    _stopDiscovery();

    final Set<String> currentlyDiscoveredDeviceAddresses = {};

    _emitLoadingState(); // Emit initial state before discovery

    _discoveryStreamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((result) async {
      _handleDiscoveryResult(result, currentlyDiscoveredDeviceAddresses);
    }, onError: (error) {
      emit(PrintMasterLoadFailure(error.toString()));
    }, onDone: () async {
      _finalizeDiscovery(currentlyDiscoveredDeviceAddresses);
    });
  }

  // Stop the discovery process manually
  void stopDiscovery() {
    _stopDiscovery();
    _emitUpdatedState({},
        isDiscovering: false); // Stop spinner when manually stopped
  }

  // Connect to a bonded device that is not yet connected
  Future<void> _ensurePrinterConnected(BluetoothDevice device) async {
    bool isPrinterConnected = await PrintBluetoothThermal.connectionStatus == 1;
    if (!isPrinterConnected &&
        _connectedDeviceAddresses.contains(device.address)) {
      await connectToDevice(device, autoConnect: true);
    }
  }

  // Connect bonded devices to the printer
  Future<bool> connectToDevice(BluetoothDevice device,
      {bool autoConnect = false}) async {
    if (state is! PrintMasterLoadSuccess) return false;
    final currentState = state as PrintMasterLoadSuccess;

    final bool isAlreadyBonded = await _isDeviceBonded(device);

    if (isAlreadyBonded) {
      return await _handleBondedDevice(device, currentState);
    }

    if (!autoConnect) _addDeviceToConnecting(device, currentState);

    return await _attemptBonding(device, currentState, autoConnect);
  }

  // Remove connected devices
  Future<bool> disconnectDevice(BluetoothDevice device) async {
    return await disconnectDeviceByAddress(device.address);
  }

  Future<bool> disconnectDeviceByAddress(String address) async {
    if (state is! PrintMasterLoadSuccess) return false;
    final currentState = state as PrintMasterLoadSuccess;

    final result = await FlutterBluetoothSerial.instance
        .removeDeviceBondWithAddress(address);

    if (result == true) {
      _connectedDeviceAddresses.remove(address);

      final List<BluetoothDevice> connectedDevices = currentState
          .connectedDevices
          .where((device) => device.address != address)
          .toList();

      _addDisconnectedDeviceToAvailable(
          currentState, connectedDevices, address);
    }

    return result ?? false;
  }

  // Helper Methods ------------------------------------------------------

  // Check whether Bluetooth is enabled
  Future<bool> _isBluetoothEnabled() async {
    return await FlutterBluetoothSerial.instance.isEnabled ?? false;
  }

  void _updateDiscoveredDevices(BluetoothDiscoveryResult result) {
    // Check if the device is already in the discovered devices list
    final existingDeviceIndex = _discoveredDevices.indexWhere(
        (element) => element.device.address == result.device.address);

    if (existingDeviceIndex == -1) {
      // If it's not in the list, add it
      _discoveredDevices.add(result);
    } else {
      // If it's already in the list, update its data
      _discoveredDevices[existingDeviceIndex] = result;
    }
  }

  bool _isDeviceConnected(String address) {
    // Check if the device address is in the connected devices list
    return _connectedDeviceAddresses.contains(address);
  }

  // Handle discovery results
  void _handleDiscoveryResult(BluetoothDiscoveryResult result,
      Set<String> currentlyDiscoveredDeviceAddresses) async {
    if (result.device.name != null) {
      currentlyDiscoveredDeviceAddresses.add(result.device.address);

      _updateDiscoveredDevices(result);

      final List<BluetoothDevice> bondedDevices =
          await FlutterBluetoothSerial.instance.getBondedDevices();
      bondedDevices.forEach((device) {
        _connectedDeviceAddresses.add(device.address);
      });

      final List<BluetoothDevice> connectedDevices = bondedDevices
          .where((device) => _isDeviceConnected(device.address))
          .toList();

      emit(PrintMasterLoadSuccess(
        devices: _getAvailableDevices(),
        connectedDevices: connectedDevices,
        connectingDevices: [],
        isDiscovering: false,
      ));

      // Auto-connect to bonded devices that are not yet connected
      for (var device in bondedDevices) {
        await _ensurePrinterConnected(device);
      }
    }

    _emitUpdatedState(currentlyDiscoveredDeviceAddresses);
  }

  // Finalize discovery process
  void _finalizeDiscovery(Set<String> currentlyDiscoveredDeviceAddresses) {
    log('Bluetooth device discovery finished');

    _discoveredDevices.removeWhere((element) =>
        !currentlyDiscoveredDeviceAddresses.contains(element.device.address));

    _connectedDeviceAddresses.removeWhere(
        (address) => !currentlyDiscoveredDeviceAddresses.contains(address));

    _emitUpdatedState(currentlyDiscoveredDeviceAddresses, isDiscovering: false);
  }

  // Emit loading state for discovery
  void _emitLoadingState() {
    emit(PrintMasterLoadSuccess(
      devices: [],
      connectedDevices: state is PrintMasterLoadSuccess
          ? (state as PrintMasterLoadSuccess).connectedDevices
          : [],
      connectingDevices: state is PrintMasterLoadSuccess
          ? (state as PrintMasterLoadSuccess).connectingDevices
          : [],
      isDiscovering: true,
    ));
  }

  // Ensure the device is bonded
  Future<bool> _isDeviceBonded(BluetoothDevice device) async {
    final List<BluetoothDevice> bondedDevices =
        await FlutterBluetoothSerial.instance.getBondedDevices();
    return bondedDevices.any((d) => d.address == device.address);
  }

  // Handle devices that are already bonded
  Future<bool> _handleBondedDevice(
      BluetoothDevice device, PrintMasterLoadSuccess currentState) async {
    log('Device is already bonded: ${device.address}');
    bool isPrinterConnected = await PrintBluetoothThermal.connectionStatus == 1;

    if (!isPrinterConnected) {
      await _connectToPrinter(device, currentState);
    } else {
      log('Device is already connected: ${device.address}');
      emit(PrintMasterLoadSuccess(
        devices: currentState.devices
            .where((d) => d.address != device.address)
            .toList(),
        connectedDevices: currentState.connectedDevices..add(device),
        connectingDevices: [],
        isDiscovering: currentState.isDiscovering,
      ));
    }
    return true;
  }

  // Add devices to connecting list
  void _addDeviceToConnecting(
      BluetoothDevice device, PrintMasterLoadSuccess currentState) {
    List<String> connectingDevices = List.from(currentState.connectingDevices);
    connectingDevices.add(device.address);

    emit(PrintMasterLoadSuccess(
      devices: currentState.devices,
      connectedDevices: currentState.connectedDevices,
      connectingDevices: connectingDevices,
      isDiscovering: currentState.isDiscovering,
    ));
  }

  // Start bonding process for devices
  Future<bool> _attemptBonding(BluetoothDevice device,
      PrintMasterLoadSuccess currentState, bool autoConnect) async {
    try {
      final bool? result = await FlutterBluetoothSerial.instance
          .bondDeviceAtAddress(device.address);

      if (result == true ||
          (result == null &&
              _connectedDeviceAddresses.contains(device.address))) {
        _connectedDeviceAddresses.add(device.address);
        await _connectToPrinter(device, currentState);
      } else {
        if (!autoConnect) {
          _removeDeviceFromConnecting(device, currentState);
        }
      }
    } catch (e) {
      log('Error connecting to printer: $e');
      emit(PrintMasterLoadFailure(e.toString()));
    } finally {}
    return true;
  }

  // Remove devices from connecting list
  void _removeDeviceFromConnecting(
      BluetoothDevice device, PrintMasterLoadSuccess currentState) {
    List<String> updatedConnectingDevices =
        List.from(currentState.connectingDevices)..remove(device.address);
    emit(PrintMasterLoadSuccess(
      devices: currentState.devices,
      connectedDevices: currentState.connectedDevices,
      connectingDevices: updatedConnectingDevices,
      isDiscovering: currentState.isDiscovering,
    ));
  }

  // Connect devices to the printer
  Future<void> _connectToPrinter(
      BluetoothDevice device, PrintMasterLoadSuccess currentState) async {
    final List<BluetoothDevice> connectedDevices =
        List<BluetoothDevice>.from(currentState.connectedDevices)
          ..removeWhere((d) => d.address == device.address)
          ..add(device);

    bool isPrinterConnected = await PrintBluetoothThermal.connectionStatus == 1;

    if (!isPrinterConnected) {
      int retryCount = 0;
      const int maxRetries = 3;
      bool connected = false;

      while (retryCount < maxRetries && !connected) {
        try {
          await PrintBluetoothThermal.connect(
              macPrinterAddress: device.address);
          connected = true;
        } catch (e) {
          retryCount++;
          log('Retrying connection to printer (${retryCount}/$maxRetries)');
          await Future.delayed(Duration(seconds: 2));
        }
      }

      if (connected) {
        _connectedDeviceAddresses.add(device.address);
        emit(PrintMasterLoadSuccess(
          devices: currentState.devices
              .where((d) => d.address != device.address)
              .toList(),
          connectedDevices: connectedDevices,
          connectingDevices: [],
          isDiscovering: currentState.isDiscovering,
        ));
      } else {
        log('Failed to connect to printer after $maxRetries attempts');
      }
    } else {
      emit(PrintMasterLoadSuccess(
        devices: currentState.devices
            .where((d) => d.address != device.address)
            .toList(),
        connectedDevices: connectedDevices,
        connectingDevices: [],
        isDiscovering: currentState.isDiscovering,
      ));
    }
  }

  // Emit updated state after discovery
  void _emitUpdatedState(Set<String> currentlyDiscoveredDeviceAddresses,
      {bool isDiscovering = true}) {
    final List<BluetoothDevice> updatedDevices = _getAvailableDevices()
        .where((device) =>
            currentlyDiscoveredDeviceAddresses.contains(device.address))
        .toList();
    final List<BluetoothDevice> connectedDevices =
        _connectedDeviceAddresses.map((address) {
      final result = _discoveredDevices.firstWhere(
          (d) => d.device.address == address,
          orElse: () => BluetoothDiscoveryResult(
              device: BluetoothDevice(
                  address: address,
                  name: null,
                  type: BluetoothDeviceType.unknown)));
      return result.device;
    }).toList();

    log('Currently connected devices: ${connectedDevices.map((d) => d.address).toList()}');
    log('Currently available devices: ${updatedDevices.map((d) => d.address).toList()}');

    emit(PrintMasterLoadSuccess(
      devices: updatedDevices,
      connectedDevices: connectedDevices,
      connectingDevices: state is PrintMasterLoadSuccess
          ? (state as PrintMasterLoadSuccess).connectingDevices
          : [],
      isDiscovering: isDiscovering,
    ));
  }

  // Get available devices (not connected)
  List<BluetoothDevice> _getAvailableDevices() {
    return _discoveredDevices
        .map((result) => result.device)
        .where((device) => !_connectedDeviceAddresses.contains(device.address))
        .toList();
  }

  // Stop the discovery stream
  void _stopDiscovery() {
    _discoveryStreamSubscription?.cancel();
    _discoveryStreamSubscription = null;
  }

  // Add disconnected devices to available devices list
  void _addDisconnectedDeviceToAvailable(PrintMasterLoadSuccess currentState,
      List<BluetoothDevice> connectedDevices, String address) {
    final device = _discoveredDevices
        .firstWhere((element) => element.device.address == address,
            orElse: () => BluetoothDiscoveryResult(
                device:
                    BluetoothDevice(address: address, name: 'Unknown Device')))
        .device;

    final List<BluetoothDevice> availableDevices =
        List<BluetoothDevice>.from(currentState.devices)..add(device);

    emit(PrintMasterLoadSuccess(
      devices: availableDevices,
      connectedDevices: connectedDevices,
      connectingDevices: [],
      isDiscovering: currentState.isDiscovering,
    ));
  }

  @override
  Future<void> close() {
    _stopDiscovery();
    return super.close();
  }
}

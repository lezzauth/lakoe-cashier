import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:logman/logman.dart';
import 'package:lakoe_pos/features/print/application/cubit/print_master/print_master_state.dart';
import 'package:lakoe_pos/utils/helpers/bluetooth_permission.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class PrintMasterCubit extends Cubit<PrintMasterState> {
  StreamSubscription<BluetoothDiscoveryResult>? discoveryStream;
  bool isDiscoveryRunning = false;

  PrintMasterCubit() : super(PrintMasterInitial());

  Future<void> checkBluetoothStatus() async {
    bool? isBluetoothEnabled = await FlutterBluetoothSerial.instance.isEnabled;
    if (!isBluetoothEnabled!) {
      Logman.instance.info('Bluetooth tidak aktif. Menghentikan proses...');
      emit(PrintMasterBluetoothDisabled());
      return;
    }
  }

  Future<void> init() async {
    try {
      emit(PrintMasterLoadInProgress());

      final permissions = await TBluetoothPermission.checkPermissions();
      bool isPermissionsAllowed = ![
        permissions.bluetoothConnect,
        permissions.bluetoothScan,
        permissions.nearbyDevices
      ].contains(true);

      if (!isPermissionsAllowed) {
        emit(PrintMasterPermissionDenied(
          bluetoothConnect: permissions.bluetoothConnect,
          bluetoothScan: permissions.bluetoothScan,
          nearbyDevices: permissions.nearbyDevices,
        ));
        return;
      }

      // List<BluetoothDevice> bondDevices =
      //     await FlutterBluetoothSerial.instance.getBondedDevices();

      emit(PrintMasterLoadSuccess(
        // devices: bondDevices
        //     .where((device) => device.isBonded && !device.isConnected)
        //     .toList(),
        // connectedDevices: bondDevices
        //     .where((device) => device.isBonded && device.isConnected)
        //     .toList(),
        devices: [],
        connectedDevices: [],
        availableDevices: [],
        connectingDevices: [],
        isDiscovering: true,
      ));
    } catch (e) {
      emit(PrintMasterLoadFailure(e.toString()));
    }
  }

  Future<void> discoverDevices() async {
    await checkBluetoothStatus();

    if (isDiscoveryRunning) {
      Logman.instance.info(
          'Discovery sudah berjalan. Menghentikan discovery yang lama dan memulai ulang...');
      await stopDiscovery();
    }

    isDiscoveryRunning = true;
    Logman.instance.info('Memulai discovery...');

    if (state is! PrintMasterLoadSuccess) {
      Logman.instance.info('State belum siap untuk melakukan discovery.');
      isDiscoveryRunning = false;
      emit(PrintMasterLoadSuccess(
        devices: [],
        connectedDevices: [],
        availableDevices: [],
        connectingDevices: [],
        isDiscovering: true,
      ));
    }

    final currentState = state as PrintMasterLoadSuccess;

    try {
      emit(PrintMasterLoadSuccess(
        devices: currentState.devices,
        connectedDevices: currentState.connectedDevices,
        availableDevices: currentState.availableDevices,
        connectingDevices: currentState.connectingDevices,
        pairingDevices: currentState.pairingDevices,
        disconnectingDevices: currentState.disconnectingDevices,
        isDiscovering: true,
      ));
      discoveryStream = FlutterBluetoothSerial.instance.startDiscovery().listen(
        (result) async {
          Logman.instance.info('Device found: ${result.device.name}');
          BluetoothDevice newDevice = result.device;

          if (newDevice.name != null &&
              newDevice.name!.isNotEmpty &&
              !currentState.availableDevices
                  .any((device) => device.address == newDevice.address)) {
            currentState.availableDevices.add(newDevice);

            List<BluetoothDevice> bondDevices =
                await FlutterBluetoothSerial.instance.getBondedDevices();

            bool isBonded = bondDevices.any((bondedDevice) =>
                bondedDevice.address == result.device.address);

            if (isBonded) {
              if (result.device.isBonded && !result.device.isConnected) {
                currentState.devices.removeWhere(
                    (device) => device.address == result.device.address);

                currentState.devices.add(result.device);
              } else if (result.device.isBonded && result.device.isConnected) {
                currentState.connectedDevices.removeWhere(
                    (device) => device.address == result.device.address);

                currentState.connectedDevices.add(result.device);
              } else {
                currentState.devices.addAll(currentState.devices);
                currentState.connectedDevices
                    .addAll(currentState.connectedDevices);
              }
            }

            List<BluetoothDevice> availableDevices =
                currentState.availableDevices.where((device) {
              return !currentState.devices
                      .any((bonded) => bonded.address == device.address) &&
                  !currentState.connectedDevices
                      .any((connected) => connected.address == device.address);
            }).toList();

            emit(PrintMasterLoadSuccess(
              devices: currentState.devices,
              connectedDevices: currentState.connectedDevices,
              availableDevices: availableDevices,
              connectingDevices: currentState.connectingDevices,
              pairingDevices: currentState.pairingDevices,
              disconnectingDevices: currentState.disconnectingDevices,
              isDiscovering: true,
            ));
          } else {}
        },
        onError: (error) {
          Logman.instance.info('Terjadi error saat discovery: $error');
          isDiscoveryRunning = false;
          discoverDevices();
        },
        cancelOnError: true,
      );

      discoveryStream?.onDone(() async {
        Logman.instance.info(
            'Discovery selesai, ditemukan ${currentState.availableDevices.length} perangkat');
        isDiscoveryRunning = false;

        List<BluetoothDevice> availableDevices =
            currentState.availableDevices.where((device) {
          return !currentState.devices
                  .any((bonded) => bonded.address == device.address) &&
              !currentState.connectedDevices
                  .any((connected) => connected.address == device.address);
        }).toList();

        emit(PrintMasterLoadSuccess(
          devices: currentState.devices,
          connectedDevices: currentState.connectedDevices,
          availableDevices: availableDevices,
          connectingDevices: currentState.connectingDevices,
          pairingDevices: currentState.pairingDevices,
          disconnectingDevices: currentState.disconnectingDevices,
          isDiscovering: false,
        ));

        // updateDevices();
      });
    } catch (e) {
      Logman.instance.info('Error selama proses discovery: $e');
      isDiscoveryRunning = false;
    }
  }

  Future<void> updateDevices() async {
    List<BluetoothDevice> bondDevices =
        await FlutterBluetoothSerial.instance.getBondedDevices();

    if (state is PrintMasterLoadSuccess) {
      final currentState = state as PrintMasterLoadSuccess;

      for (BluetoothDevice bondDevice in bondDevices) {
        if (!currentState.availableDevices.any((availableDevice) =>
            availableDevice.address == bondDevice.address)) {
          currentState.devices
              .removeWhere((device) => device.address == bondDevice.address);
          currentState.connectedDevices
              .removeWhere((device) => device.address == bondDevice.address);
        }
      }

      emit(PrintMasterLoadSuccess(
        devices: currentState.devices,
        connectedDevices: currentState.connectedDevices,
        availableDevices: currentState.availableDevices,
        isDiscovering: currentState.isDiscovering,
      ));
    }
  }

  Future<void> stopDiscovery() async {
    if (discoveryStream != null) {
      Logman.instance.info('Stopping discovery...');
      await discoveryStream!.cancel();
      discoveryStream = null;
      isDiscoveryRunning = false;
      Logman.instance.info('Discovery stopped');

      final currentState = state as PrintMasterLoadSuccess;

      emit(PrintMasterLoadSuccess(
        devices: currentState.devices,
        connectedDevices: currentState.connectedDevices,
        availableDevices: currentState.availableDevices,
        isDiscovering: false,
        connectingDevices: [],
        disconnectingDevices: [],
      ));
    }
  }

  Future<bool> isDeviceBonded(BluetoothDevice device) async {
    List<BluetoothDevice> bondedDevices =
        await FlutterBluetoothSerial.instance.getBondedDevices();

    return bondedDevices
        .any((bondedDevice) => bondedDevice.address == device.address);
  }

  Future<bool> connectToDevice(BluetoothDevice device) async {
    if (state is! PrintMasterLoadSuccess) return false;

    final currentState = state as PrintMasterLoadSuccess;

    List<String> connectingDevices = List.from(currentState.connectingDevices);
    connectingDevices.add(device.address);

    emit(PrintMasterLoadSuccess(
      devices: currentState.devices,
      connectedDevices: currentState.connectedDevices,
      availableDevices: currentState.availableDevices,
      connectingDevices: connectingDevices,
    ));

    try {
      Logman.instance
          .info('Connecting to device: ${device.name} (${device.address})');

      await Future.delayed(const Duration(seconds: 1));

      final bool result = await PrintBluetoothThermal.connect(
          macPrinterAddress: device.address);

      List<BluetoothDevice> connectedDevices =
          List.from(currentState.connectedDevices);

      if (result) {
        Logman.instance.info(
            'Successfully connected to: ${device.name} (${device.address})');

        connectedDevices.add(device);

        List<BluetoothDevice> updatedDevices = currentState.devices
            .where((d) => d.address != device.address)
            .toList();
        List<BluetoothDevice> updatedAvailableDevices = currentState
            .availableDevices
            .where((d) => d.address != device.address)
            .toList();

        emit(PrintMasterLoadSuccess(
          devices: updatedDevices,
          connectedDevices: connectedDevices,
          availableDevices: updatedAvailableDevices,
          connectingDevices: [],
        ));
        return true;
      } else {
        Logman.instance
            .info('Failed to connect to: ${device.name} (${device.address})');
        discoverDevices();

        List<BluetoothDevice> updatedAvailableDevices =
            List.from(currentState.availableDevices);

        updatedAvailableDevices
            .removeWhere((element) => element.address == device.address);

        emit(PrintMasterLoadSuccess(
          devices: currentState.devices,
          connectedDevices: currentState.connectedDevices,
          availableDevices: updatedAvailableDevices,
          connectingDevices: [],
        ));

        return false;
      }
    } catch (e) {
      Logman.instance.info('Error connecting to device: $e');
      return false;
    } finally {
      final currentState = state as PrintMasterLoadSuccess;
      emit(PrintMasterLoadSuccess(
        devices: currentState.devices,
        connectedDevices: currentState.connectedDevices,
        availableDevices: currentState.availableDevices,
        connectingDevices: [],
      ));
    }
  }

  Future<bool> disconnectDevice(BluetoothDevice device) async {
    if (state is! PrintMasterLoadSuccess) return false;
    final currentState = state as PrintMasterLoadSuccess;

    List<BluetoothDevice> connectedDevices =
        List.from(currentState.connectedDevices);

    try {
      List<String> disconnectingDevices =
          List.from(currentState.disconnectingDevices);
      disconnectingDevices.add(device.address);

      emit(PrintMasterLoadSuccess(
        devices: currentState.devices,
        connectedDevices: currentState.connectedDevices,
        availableDevices: currentState.availableDevices,
        disconnectingDevices: disconnectingDevices,
      ));

      await Future.delayed(const Duration(seconds: 2));

      final result = await PrintBluetoothThermal.disconnect;

      if (result) {
        connectedDevices
            .removeWhere((element) => element.address == device.address);

        List<BluetoothDevice> updatedDevices = List.from(currentState.devices)
          ..add(device);

        emit(PrintMasterLoadSuccess(
          devices: updatedDevices,
          connectedDevices: connectedDevices,
          availableDevices: currentState.availableDevices,
          connectingDevices: [],
          disconnectingDevices: [],
          isDiscovering: false,
        ));

        Logman.instance
            .info('Successfully disconnected from: ${device.address}');
      }

      return result;
    } catch (e) {
      Logman.instance.info('Error disconnecting device: $e');
      return false;
    }
  }

  Future<void> unpairDeviceByAddress(String address) async {
    try {
      Logman.instance.info('Unpairing device with address: $address');
      bool? unpaired = await FlutterBluetoothSerial.instance
          .removeDeviceBondWithAddress(address);
      if (unpaired!) {
        Logman.instance
            .info('Successfully unpaired device with address: $address');
      } else {
        Logman.instance.info('Failed to unpair device with address: $address');
      }
    } catch (e) {
      Logman.instance.info('Error unpairing device: $e');
    }
  }

  Future<void> unpairDevice(BluetoothDevice device) async {
    try {
      final currentState = state as PrintMasterLoadSuccess;

      List<String> pairingDevices = List.from(currentState.pairingDevices);
      pairingDevices.add(device.address);

      emit(PrintMasterLoadSuccess(
        devices: currentState.devices,
        connectedDevices: currentState.connectedDevices,
        availableDevices: currentState.availableDevices,
        pairingDevices: pairingDevices,
      ));

      await Future.delayed(const Duration(seconds: 2));

      Logman.instance
          .info('Unpairing device: ${device.name} (${device.address})');
      await unpairDeviceByAddress(device.address);

      if (state is PrintMasterLoadSuccess) {
        final currentState = state as PrintMasterLoadSuccess;

        List<BluetoothDevice> updatedDevices = List.from(currentState.devices)
          ..removeWhere((d) => d.address == device.address);

        List<BluetoothDevice> updatedAvailableDevices =
            List.from(currentState.availableDevices);

        if (currentState.availableDevices.isNotEmpty) {
          updatedAvailableDevices.add(device);
        }

        emit(PrintMasterLoadSuccess(
          devices: updatedDevices,
          connectedDevices: currentState.connectedDevices,
          availableDevices: updatedAvailableDevices,
          connectingDevices: [],
          pairingDevices: [],
          disconnectingDevices: [],
          isDiscovering: false,
        ));
      }
    } catch (e) {
      Logman.instance.info('Error unpairing device: $e');
    }
  }

  @override
  Future<void> close() {
    stopDiscovery();
    return super.close();
  }
}

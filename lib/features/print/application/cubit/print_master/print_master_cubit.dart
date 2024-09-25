import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/print/application/cubit/print_master/print_master_state.dart';
import 'package:point_of_sales_cashier/utils/helpers/bluetooth_permission.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class PrintMasterCubit extends Cubit<PrintMasterState> {
  PrintMasterCubit() : super(PrintMasterInitial());

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
        return emit(PrintMasterPermissionDenied(
          bluetoothConnect: permissions.bluetoothConnect,
          bluetoothScan: permissions.bluetoothScan,
          nearbyDevices: permissions.nearbyDevices,
        ));
      }

      final List<BluetoothInfo> devices =
          await PrintBluetoothThermal.pairedBluetooths;

      if (state is PrintMasterLoadSuccess) {
        final currentState = state as PrintMasterLoadSuccess;
        emit(PrintMasterLoadSuccess(
          devices: devices,
          connectedDevices: currentState.connectedDevices,
        ));
      } else {
        emit(PrintMasterLoadSuccess(devices: devices));
      }
    } catch (e) {
      emit(PrintMasterLoadFailure(e.toString()));
    }
  }

  Future<bool> connectToDevice(BluetoothInfo device) async {
    if (state is! PrintMasterLoadSuccess) return false;
    final currentState = state as PrintMasterLoadSuccess;

    List<String> connectingDevices = List.from(currentState.connectingDevices);
    connectingDevices.add(device.macAdress);

    emit(PrintMasterLoadSuccess(
      devices: currentState.devices,
      connectedDevices: currentState.connectedDevices,
      connectingDevices: connectingDevices,
    ));

    final bool result = await PrintBluetoothThermal.connect(
        macPrinterAddress: device.macAdress);

    log('result: $result');

    List<BluetoothInfo> connectedDevices =
        List.from(currentState.connectedDevices);

    if (result == true) {
      connectedDevices.add(device);
      emit(PrintMasterLoadSuccess(
        devices: currentState.devices,
        connectedDevices: connectedDevices,
      ));
    } else {
      await PrintBluetoothThermal.disconnect;
      disconnectDevice(device);
    }

    return result;
  }

  Future<bool> disconnectDevice(BluetoothInfo device) async {
    if (state is! PrintMasterLoadSuccess) return false;
    final currentState = state as PrintMasterLoadSuccess;

    List<BluetoothInfo> connectedDevices =
        List.from(currentState.connectedDevices);

    final result = await PrintBluetoothThermal.disconnect;

    connectedDevices.removeWhere(
      (element) => element.macAdress == device.macAdress,
    );

    emit(PrintMasterLoadSuccess(
      devices: currentState.devices,
      connectedDevices: connectedDevices,
    ));

    return result;
  }
}

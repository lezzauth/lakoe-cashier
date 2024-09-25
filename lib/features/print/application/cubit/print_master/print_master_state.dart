import 'package:equatable/equatable.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

sealed class PrintMasterState extends Equatable {}

final class PrintMasterInitial extends PrintMasterState {
  @override
  List<Object?> get props => [];
}

final class PrintMasterLoadInProgress extends PrintMasterState {
  @override
  List<Object?> get props => [];
}

final class PrintMasterPermissionDenied extends PrintMasterState {
  // if any of this values is true then it's been denied
  final bool bluetoothScan;
  final bool bluetoothConnect;
  final bool nearbyDevices;

  PrintMasterPermissionDenied({
    this.bluetoothConnect = false,
    this.bluetoothScan = false,
    this.nearbyDevices = false,
  });

  @override
  List<Object?> get props => [
        bluetoothConnect,
        bluetoothScan,
        nearbyDevices,
      ];
}

final class PrintMasterLoadSuccess extends PrintMasterState {
  final List<BluetoothInfo> devices;
  final List<BluetoothInfo> connectedDevices;
  final List<String> connectingDevices;

  PrintMasterLoadSuccess({
    required this.devices,
    this.connectedDevices = const [],
    this.connectingDevices = const [],
  });

  @override
  List<Object?> get props => [devices, connectedDevices, connectingDevices];
}

final class PrintMasterLoadFailure extends PrintMasterState {
  final String error;

  PrintMasterLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

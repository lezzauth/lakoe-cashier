import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

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
  // If any of this values is true, it's been denied
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
  final List<BluetoothDevice> devices;
  final List<BluetoothDevice> connectedDevices;
  final List<String> connectingDevices;
  final bool isDiscovering; // Tambahkan flag isDiscovering

  PrintMasterLoadSuccess({
    required this.devices,
    this.connectedDevices = const [],
    this.connectingDevices = const [],
    this.isDiscovering = false, // Default-nya false
  });

  @override
  List<Object?> get props => [
        devices,
        connectedDevices,
        connectingDevices,
        isDiscovering, // Tambahkan flag ini di props
      ];
}

final class PrintMasterLoadFailure extends PrintMasterState {
  final String error;

  PrintMasterLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class PrintMasterBluetoothDisabled extends PrintMasterState {
  @override
  List<Object?> get props => [];
}

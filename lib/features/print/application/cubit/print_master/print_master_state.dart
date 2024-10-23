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
  final List<BluetoothDevice> availableDevices;
  final List<String> pairingDevices;
  final List<String> connectingDevices;
  final List<String> disconnectingDevices;
  final bool isDiscovering;

  PrintMasterLoadSuccess({
    required this.devices,
    this.connectedDevices = const [],
    this.availableDevices = const [],
    this.pairingDevices = const [],
    this.connectingDevices = const [],
    this.disconnectingDevices = const [],
    this.isDiscovering = false,
  });

  @override
  List<Object?> get props => [
        devices,
        connectedDevices,
        availableDevices,
        pairingDevices,
        connectingDevices,
        disconnectingDevices,
        isDiscovering,
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

final class PrintMasterAutoPrinting extends PrintMasterState {
  final bool isBillAutoPrint;

  PrintMasterAutoPrinting({required this.isBillAutoPrint});

  @override
  List<Object?> get props => [];
}

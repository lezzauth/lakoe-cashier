import 'package:permission_handler/permission_handler.dart';

class TBluetoothPermission {
  TBluetoothPermission._();

  static Future<BluetoothPermissionStatus> checkPermissions() async {
    // Check if the required permissions are granted
    PermissionStatus bluetoothScanStatus =
        await Permission.bluetoothScan.status;
    PermissionStatus bluetoothConnectStatus =
        await Permission.bluetoothConnect.status;
    PermissionStatus nearbyDevicesStatus = await Permission.location.status;

    // If not granted, request the permissions
    if (bluetoothScanStatus.isDenied) {
      await Permission.bluetoothScan.request();
    }

    if (bluetoothConnectStatus.isDenied) {
      await Permission.bluetoothConnect.request();
    }

    if (nearbyDevicesStatus.isDenied) {
      await Permission.location.request();
    }

    // Check if permissions are permanently denied (open settings if so)
    // if (bluetoothScanStatus.isPermanentlyDenied ||
    //     bluetoothConnectStatus.isPermanentlyDenied ||
    //     nearbyDevicesStatus.isPermanentlyDenied) {
    //   return false;
    // }

    return BluetoothPermissionStatus(
      bluetoothConnect: bluetoothConnectStatus.isPermanentlyDenied,
      bluetoothScan: bluetoothScanStatus.isPermanentlyDenied,
      nearbyDevices: nearbyDevicesStatus.isPermanentlyDenied,
    );

    // return true;
  }
}

class BluetoothPermissionStatus {
  final bool bluetoothScan;
  final bool bluetoothConnect;
  final bool nearbyDevices;

  BluetoothPermissionStatus({
    required this.bluetoothConnect,
    required this.bluetoothScan,
    required this.nearbyDevices,
  });
}

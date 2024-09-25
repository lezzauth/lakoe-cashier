import 'package:permission_handler/permission_handler.dart';

class TBluetoothPermission {
  TBluetoothPermission._();

  static Future<void> checkBluetoothPermissions() async {
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
    if (bluetoothScanStatus.isPermanentlyDenied ||
        bluetoothConnectStatus.isPermanentlyDenied ||
        nearbyDevicesStatus.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}

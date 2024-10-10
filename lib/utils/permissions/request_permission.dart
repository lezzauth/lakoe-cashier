import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:point_of_sales_cashier/common/widgets/access_permission/location_denied_permission.dart';
import 'package:point_of_sales_cashier/common/widgets/access_permission/location_permission.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';

abstract class RequestPermission {
  Permission get permission;
  Future<bool?> request(BuildContext context);
}

class LocationRequestPermission implements RequestPermission {
  @override
  Permission get permission => Permission.location;

  @override
  Future<bool?> request(
    BuildContext context,
  ) async {
    final status = await permission.status;

    if (status.isGranted) {
      return true;
    }

    if (!context.mounted) return null;
    return await _showRequestPermissionBottomSheet(context);
  }

  Future<bool?> _showRequestPermissionBottomSheet(BuildContext context) async {
    final result = await showModalBottomSheet<PermissionStatus?>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CustomBottomsheet(
          child: LocationPermission(),
        );
      },
    );
    if (result == null) return null;

    if (result.isGranted) {
      return true;
    }

    if (!context.mounted) return null;
    _showDeniedPermissionBottomSheet(context);

    return null;
  }

  Future<void> _showDeniedPermissionBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => CustomBottomsheet(
        child: const LocationDeniedPermission(),
      ),
    );
  }
}

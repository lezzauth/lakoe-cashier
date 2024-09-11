import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:point_of_sales_cashier/common/widgets/access_permission/access_permission.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class ContactPermission extends StatelessWidget {
  const ContactPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return AccessPermission(
      description:
          "Dengan ini, kamu akan bisa menggunakan fitur aplikasi yang data kontak HP.",
      imageSrc: TImages.contactPermission,
      title: "Izin untuk bisa akses kontak HP kamu",
      onRequest: () async {
        await Permission.contacts.request();

        if (await Permission.contacts.isGranted) {
          if (!context.mounted) return;
          Navigator.pop(context);
        }
      },
    );
  }
}

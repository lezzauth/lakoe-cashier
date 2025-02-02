import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:lakoe_pos/common/widgets/buttons/tertiary_button.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:logman/logman.dart';

class AppUpdateHelper {
  static Future<void> checkForUpdate({required BuildContext context}) async {
    try {
      AppUpdateInfo updateInfo = await InAppUpdate.checkForUpdate();
      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        if (!context.mounted) return;
        _showUpdateDialog(context, updateInfo);
      } else {
        if (!context.mounted) return;
        Logman.instance.info('No update available.');
      }
    } catch (e) {
      Logman.instance.info('Error checking for update: $e');
    }
  }

  static void _showUpdateDialog(
    BuildContext context,
    AppUpdateInfo updateInfo,
  ) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return CustomBottomsheet(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          TImages.updateAvailable,
                          width: double.infinity,
                          height: 190,
                        ),
                        SizedBox(height: 40),
                        TextHeading2(
                          "Update Lakoe, yuk!",
                          color: TColors.neutralDarkDark,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 4),
                        TextBodyL(
                          "Ada versi terbaru dari Lakoe yang bisa kamu update sekarang juga!",
                          color: TColors.neutralDarkDark,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TertiaryButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: TextActionL("Nanti Saja"),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              if (updateInfo.immediateUpdateAllowed) {
                                performImmediateUpdate(context);
                              } else {
                                performFlexibleUpdate(context);
                              }
                            },
                            child: TextActionL("Oke, Update"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  static Future<void> performImmediateUpdate(BuildContext context) async {
    if (!context.mounted) return;
    try {
      await InAppUpdate.performImmediateUpdate();
      if (!context.mounted) return;
      Logman.instance.info('Immediate update completed successfully!');
      _showSnackBar('Berhasil update aplikasi!');
    } catch (e) {
      Logman.instance.info('Failed to complete immediate update: $e');
      _showSnackBar('Gagal update aplikasi!');
    }
  }

  static Future<void> performFlexibleUpdate(BuildContext context) async {
    if (!context.mounted) return;
    try {
      await InAppUpdate.startFlexibleUpdate();
      await InAppUpdate.completeFlexibleUpdate();
      if (!context.mounted) return;
      Logman.instance.info('Flexible update completed successfully!');
      _showSnackBar('Berhasil update aplikasi!');
    } catch (e) {
      Logman.instance.info('Failed to complete flexible update: $e');
      _showSnackBar('Gagal update aplikasi!');
    }
  }

  static void _showSnackBar(String message) {
    CustomToast.show(message, position: 'bottom', duration: 5);
  }
}

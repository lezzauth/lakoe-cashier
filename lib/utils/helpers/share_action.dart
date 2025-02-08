import 'dart:io';
import 'package:flutter/material.dart';
import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lakoe_pos/common/widgets/form/form_label.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/customers/common/widgets/customer_contact/customer_contact_item.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:lakoe_pos/utils/helpers/receipt_helpers.dart';
import 'package:logman/logman.dart';
import 'package:order_repository/order_repository.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:path_provider/path_provider.dart';

class ShareAction {
  static const _channel = MethodChannel('com.lakoe.app/whatsapp');

  static Future<void> sendWhatsAppImage(
    String phoneNumber,
    Uint8List imageBytes,
    String message,
  ) async {
    final directory = await getExternalStorageDirectory();
    final imagePath = File('${directory!.path}/lakoe_receipt.png');
    await imagePath.writeAsBytes(imageBytes);

    Logman.instance.info("XXX WhatsApp: ${phoneNumber.substring(1)}");

    await _channel.invokeMethod('sendWhatsAppImage', {
      "phone": phoneNumber.substring(1),
      "filePath": imagePath.path,
      "message": message,
    });
  }

  static void showShareBottomSheet(
    BuildContext context, {
    CustomerModel? customer,
    required Uint8List imageBytes,
    required OrderModel order,
    required OwnerProfileModel ownerProfile,
  }) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
    final ValueNotifier<bool> isButtonEnabled = ValueNotifier(false);

    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        return CustomBottomsheet(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: TextHeading2("Bagikan struk pesanan ke…"),
              ),
              if (customer != null)
                CustomerContactItem(
                    customer: customer,
                    onTap: () {
                      sendWhatsAppImage(
                        customer.phoneNumber,
                        imageBytes,
                        "Halo! Ini adalah struk pesanan kamu dengan nomor #${order.no}.\n\nTerimakasih sudah mampir di ${ownerProfile.outlets[0].name}! 😊\n\nSampai jumpa lagi di kunjungan berikutnya! ❤️",
                      );
                      Navigator.pop(context);
                    }),
              InkWell(
                onTap: () async {
                  await ReceiptHelper.shareImage(context, imageBytes, order);
                  if (!context.mounted) return;
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: TColors.neutralLightMedium,
                        radius: 20,
                        child: UiIcons(
                          TIcons.share,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 16),
                      TextHeading4("Bagikan ke lainnya")
                    ],
                  ),
                ),
              ),
              Divider(color: TColors.neutralLightMedium),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FormBuilder(
                  key: formKey,
                  onChanged: () {
                    isButtonEnabled.value =
                        formKey.currentState?.validate() == true;
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormLabel("Kirim lewat WA"),
                      FormBuilderTextField(
                        name: "phoneNumber",
                        decoration: const InputDecoration(
                          hintText: "Masukan nomor WA pelanggan…",
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          PhoneNumberFormatter(isDisplayFormat: true),
                          LengthLimitingTextInputFormatter(15),
                        ],
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.maxLength(15,
                              errorText: ErrorTextStrings.maxLength(
                                  maxLength: 15, isNumber: true)),
                          FormBuilderValidators.minLength(11,
                              errorText: ErrorTextStrings.minLength(
                                  minLength: 11, isNumber: true)),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: TColors.neutralLightMedium,
                      width: 1.0,
                    ),
                  ),
                ),
                child: ValueListenableBuilder<bool>(
                  valueListenable: isButtonEnabled,
                  builder: (context, isEnabled, child) {
                    return ElevatedButton(
                      onPressed: isEnabled
                          ? () async {
                              String phoneNumber =
                                  PhoneNumberFormatter.formatForRequest(formKey
                                      .currentState
                                      ?.fields['phoneNumber']
                                      ?.value);
                              if (phoneNumber.isEmpty) return;

                              await sendWhatsAppImage(
                                phoneNumber,
                                imageBytes,
                                "Halo! Ini adalah struk pesanan kamu dengan nomor #${order.no}.\n\nTerimakasih sudah mampir di ${ownerProfile.outlets[0].name}! 😊\n\nSampai jumpa lagi di kunjungan berikutnya! ❤️",
                              );

                              if (!context.mounted) return;
                              Navigator.pop(context);
                            }
                          : null,
                      child: TextActionL("Lanjutkan"),
                    );
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        );
      },
    );
  }
}

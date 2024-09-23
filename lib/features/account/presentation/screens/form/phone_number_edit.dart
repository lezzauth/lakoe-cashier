import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class PhoneNumberEditScreen extends StatefulWidget {
  const PhoneNumberEditScreen({super.key});

  @override
  State<PhoneNumberEditScreen> createState() => _PhoneNumberEditScreenState();
}

class _PhoneNumberEditScreenState extends State<PhoneNumberEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextHeading2(
                        "Ubah Nomor WA",
                        color: TColors.neutralDarkDark,
                      ),
                      TextBodyM(
                        "Silahkan masukkan nomor WA baru untuk menggantikan nomor sebelumnya.",
                        color: TColors.neutralDarkDark,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 48,
                        width: 85,
                        decoration: BoxDecoration(
                          color: TColors.neutralLightLight,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: TColors.neutralLightDarkest,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 8,
                            direction: Axis.horizontal,
                            children: [
                              Image.asset(
                                TImages.indoFlag,
                                height: 20,
                                width: 20,
                              ),
                              const TextHeading4("+62"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: FormBuilderTextField(
                          name: "phoneNumber",
                          decoration: const InputDecoration(
                            hintText: "Masukan nomor WA",
                          ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [PhoneNumberFormatter()],
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.startsWith("8",
                                errorText: "Nomor dimulai dengan angka 8"),
                            FormBuilderValidators.maxLength(12,
                                errorText: ErrorTextStrings.maxLength(
                                    maxLength: 12, isNumber: true)),
                            FormBuilderValidators.minLength(9,
                                errorText: ErrorTextStrings.minLength(
                                    minLength: 9, isNumber: true)),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: TColors.neutralLightMedium,
                  width: 1.0,
                ),
              ),
            ),
            child: ElevatedButton(
              onPressed: () => print("Verification!"),
              child: const TextActionL(
                "Lanjut Verifikasi OTP",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

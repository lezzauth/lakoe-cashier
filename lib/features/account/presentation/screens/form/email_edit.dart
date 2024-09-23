import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/general_information.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class EmailEditScreen extends StatefulWidget {
  const EmailEditScreen({super.key});

  @override
  State<EmailEditScreen> createState() => _EmailEditScreenState();
}

class _EmailEditScreenState extends State<EmailEditScreen> {
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
                        "Ubah Email",
                        color: TColors.neutralDarkDark,
                      ),
                      TextBodyL(
                        "Silahkan masukan email baru untuk menggantikan email sebelumnya.",
                        color: TColors.neutralDarkDark,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  FormBuilderTextField(
                    keyboardType: TextInputType.emailAddress,
                    name: "email",
                    initialValue: "",
                    decoration: const InputDecoration(
                      hintText: "Contoh:  warmindo@gmail.com",
                    ),
                    validator: FormBuilderValidators.email(
                      errorText: ErrorTextStrings.email(),
                    ),
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
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CustomBottomsheet(
                      child: GeneralInformation(
                        imageSrc: TImages.generalIllustration,
                        title: "Cek email kamu untuk verifikasi",
                        description:
                            "Silahkan cek kontak masuk warmindo@gmail.com. Email hanya berlaku selamam 15 menit, lebih dari itu kamu perlu verifikasi ulang.",
                        onRequest: () {
                          Navigator.pop(context);
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return CustomBottomsheet(
                                child: GeneralInformation(
                                  imageSrc: TImages.successIllustration,
                                  title: "Berhasil verifikasi email baru",
                                  description:
                                      "Email kamu berhasil terverifikasi dan aktif untuk bisa digunakan.",
                                  onRequest: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  actionTitle: "Selesai",
                                ),
                              );
                            },
                          );
                        },
                        actionTitle: "Buka Aplikasi Email",
                      ),
                    );
                  },
                );
              },
              child: const TextActionL(
                "Lanjut Verifikasi Email",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

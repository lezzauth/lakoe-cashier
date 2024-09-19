import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
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
                    return InformationBottomSheet(
                      imageSrc: TImages.generalIllustration,
                      title: "Cek email kamu untuk verifikasi",
                      description:
                          "Silahkan cek kontak masuk warmindo@gmail.com. Email hanya berlaku selamam 15 menit, lebih dari itu kamu perlu verifikasi ulang.",
                      onRequest: () {
                        Navigator.pop(context);
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return InformationBottomSheet(
                              imageSrc: TImages.successIllustration,
                              title: "Berhasil verifikasi email baru ",
                              description:
                                  "Email kamu berhasil terverifikasi dan aktif untuk bisa digunakan.",
                              onRequest: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              requestTitle: "Selesai",
                            );
                          },
                        );
                      },
                      requestTitle: "Buka Aplikasi Email",
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

class InformationBottomSheet extends StatelessWidget {
  const InformationBottomSheet({
    super.key,
    required this.description,
    required this.imageSrc,
    required this.title,
    required this.onRequest,
    this.requestTitle,
  });

  final String imageSrc;
  final String title;
  final String description;
  final Function() onRequest;
  final String? requestTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    imageSrc,
                    height: 72.46,
                    width: 100,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: TextHeading2(
                    title,
                    color: TColors.neutralDarkDarkest,
                  ),
                ),
                TextBodyM(
                  description,
                  color: TColors.neutralDarkMedium,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: onRequest,
                      child: TextActionL(requestTitle ?? "Berikan Izin"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

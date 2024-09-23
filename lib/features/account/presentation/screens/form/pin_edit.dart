import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/dotted_pin.dart';
import 'package:point_of_sales_cashier/common/widgets/form/number_pad.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/general_information.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class PinEditScreen extends StatefulWidget {
  const PinEditScreen({super.key});

  @override
  State<PinEditScreen> createState() => _PinEditScreenState();
}

class _PinEditScreenState extends State<PinEditScreen> {
  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: const TextHeading2(
                            "Buat PIN Baru",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const TextBodyM(
                          "Silahkan buat PIN baru yang berbeda dengan PIN sebelumnya.",
                          color: TColors.neutralDarkMedium,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  DottedPin(
                    length: 6,
                    controller: _pinController,
                    onCompleted: (value) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return CustomBottomsheet(
                            child: GeneralInformation(
                              imageSrc: TImages.successIllustration,
                              title: "PIN kamu berhasil diubah",
                              description:
                                  "Saat ini kamu harus menggunakan PIN terbaru setiap kali mau akses aplikasi.",
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
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: NumberPad(
              controller: _pinController,
              maxLength: 6,
            ),
          ),
        ],
      ),
    );
  }
}

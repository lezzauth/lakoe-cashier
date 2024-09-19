import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/dotted_pin.dart';
import 'package:point_of_sales_cashier/common/widgets/form/number_pad.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

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
                        const TextBodyL(
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
                    onCompleted: (value) {},
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

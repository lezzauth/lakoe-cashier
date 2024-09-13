import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/data/models.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class BankVerifyConfirmation extends StatefulWidget {
  const BankVerifyConfirmation({
    super.key,
    required this.accountName,
    required this.accountNumber,
    required this.bankName,
    required this.name,
  });

  final String bankName;
  final String accountNumber;
  final String accountName;
  final String name;

  @override
  State<BankVerifyConfirmation> createState() => _BankVerifyConfirmationState();
}

class _BankVerifyConfirmationState extends State<BankVerifyConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const TextHeading2(
                  "Cek lagi informasi rekening bank kamu, ya!",
                ),
              ),
              const TextBodyM(
                "Rekening bank ini akan digunakan sebagai rekening tujuan pencairan dana.",
                color: TColors.neutralDarkMedium,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: const TextHeading5(
                        "Nama Bank",
                        color: TColors.neutralDarkLightest,
                      ),
                    ),
                    TextHeading3(widget.bankName),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: const TextHeading5(
                        "Nomor Rekening",
                        color: TColors.neutralDarkLightest,
                      ),
                    ),
                    TextHeading3(widget.accountNumber),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: const TextHeading5(
                        "Nama Pemilik Rekening Bank",
                        color: TColors.neutralDarkLightest,
                      ),
                    ),
                    TextHeading3(TFormatter.censoredText(widget.accountName)),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: const TextActionL(
                      "Perbaiki",
                      color: TColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        BankVerifyArgument(
                          bankName: widget.bankName,
                          accountNumber: widget.accountNumber,
                          accountName: widget.accountName,
                          name: widget.name,
                        ),
                      );
                    },
                    child: const TextActionL(
                      "Simpan",
                      color: TColors.neutralLightLightest,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

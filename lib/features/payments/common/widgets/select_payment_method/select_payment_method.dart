import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/bank_transfer/content.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/cash/content.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/cash/form.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/debit/content.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/qris/content.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/radio.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/radio_group.dart';
import 'package:point_of_sales_cashier/utils/device/device_uility.dart';

class SelectPaymentMethod extends StatefulWidget {
  final int amount;

  const SelectPaymentMethod({super.key, required this.amount});

  @override
  State<SelectPaymentMethod> createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  String paymentMethod = "cash";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: TDeviceUtils.getViewInsets(context),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const TextHeading2("Metode pembayaran"),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: PaymentMethodRadioGroup(
                value: paymentMethod,
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value!;
                  });
                },
                limitedValues: ["qris", "bank_transfer"],
              ),
            ),
            switch (paymentMethod) {
              "cash" => CashPaymentContent(
                  amount: widget.amount,
                ),
              "qris" => QrisPaymentContent(),
              "debit" => DebitPaymentContent(),
              "bank_transfer" => BankTransferPaymentContent(),
              _ => SizedBox(),
            }
          ],
        ),
      ),
    );
  }
}

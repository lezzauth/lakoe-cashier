import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_filter_state.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/qris/footer.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/radio_group.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class QrisPaymentContent extends StatefulWidget {
  const QrisPaymentContent({super.key});

  @override
  State<QrisPaymentContent> createState() => _QrisPaymentContentState();
}

class _QrisPaymentContentState extends State<QrisPaymentContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<PaymentFilterCubit, PaymentFilterState>(
                  builder: (context, state) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12.0),
                      child: PaymentMethodRadioGroup(
                        value: state.paymentMethod,
                        onChanged: (value) {
                          context
                              .read<PaymentFilterCubit>()
                              .setPaymentMethod(paymentMethod: value!);
                        },
                        limitedValues: const [],
                      ),
                    );
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTileTheme(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        horizontalTitleGap: 0,
                        child: CheckboxListTile(
                          value: false,
                          onChanged: (value) {},
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const TextBodyS(
                            "Cetak QRIS secara otomatis",
                            color: TColors.neutralDarkDarkest,
                          ),
                          dense: true,
                          enableFeedback: false,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        QrisPaymentFooter(
          onSubmitted: () {},
        ),
      ],
    );
  }
}

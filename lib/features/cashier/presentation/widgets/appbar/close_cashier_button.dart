import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/forms/final_balance_form.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/device/device_uility.dart';

class CloseCashierButton extends StatefulWidget {
  const CloseCashierButton({
    super.key,
  });

  @override
  State<CloseCashierButton> createState() => _CloseCashierButtonState();
}

class _CloseCashierButtonState extends State<CloseCashierButton> {
  _onCashierClosed() {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: TDeviceUtils.getViewInsets(context),
          child: const FinalBalanceForm(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ElevatedButton(
        onPressed: _onCashierClosed,
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 0,
            ),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          backgroundColor: const WidgetStatePropertyAll(TColors.errorLight),
        ),
        child: const TextActionL(
          "Selesai & Tutup",
          color: TColors.error,
        ),
      ),
    );
  }
}

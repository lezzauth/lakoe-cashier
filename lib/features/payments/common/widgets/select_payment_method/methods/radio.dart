import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class PaymentMethodRadio extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;
  final Function()? onLimited;
  final bool limited;

  const PaymentMethodRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.onLimited,
    this.limited = false,
  });

  @override
  Widget build(BuildContext context) {
    bool selected = value == groupValue;

    Color? getCardColor() {
      if (limited == true) {
        return TColors.neutralLightMedium;
      }
      if (selected) {
        return TColors.highlightLightest;
      }

      return null;
    }

    Color getBorderColor() {
      if (selected) {
        return TColors.primary;
      }

      return TColors.neutralLightMedium;
    }

    return Expanded(
      child: InkWell(
        onTap: () {
          if (limited) {
            if (onLimited != null) onLimited!();
            return;
          }
          onChanged(value);
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          height: 58,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: getCardColor(),
            border: Border.all(color: getBorderColor(), width: 1),
          ),
          child: switch (value) {
            "cash" => CashPaymentRadioContent(selected: selected),
            "debit" => DebitPaymentRadioContent(selected: selected),
            "bank_transfer" =>
              BankTransferPaymentRadioContent(selected: selected),
            "qris" => QrisPaymentRadioContent(selected: selected),
            _ => const SizedBox(),
          },
        ),
      ),
    );
  }
}

class CashPaymentRadioContent extends StatelessWidget {
  final bool selected;

  const CashPaymentRadioContent({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        UiIcons(
          TIcons.moneyBill,
          height: 24,
          width: 24,
          color: selected ? TColors.primary : TColors.neutralDarkMedium,
        ),
        TextHeading5(
          "Cash (Tunai)",
          color: selected ? TColors.primary : TColors.neutralDarkMedium,
        ),
      ],
    );
  }
}

class DebitPaymentRadioContent extends StatelessWidget {
  final bool selected;

  const DebitPaymentRadioContent({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        UiIcons(
          TIcons.creditCard,
          height: 24,
          width: 24,
          color: selected ? TColors.primary : TColors.neutralDarkMedium,
        ),
        const TextHeading5(
          "Debit/Credit",
          color: TColors.neutralDarkMedium,
        ),
      ],
    );
  }
}

class BankTransferPaymentRadioContent extends StatelessWidget {
  final bool selected;

  const BankTransferPaymentRadioContent({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        UiIcons(
          TIcons.moneyBillTransfer,
          height: 24,
          width: 24,
          color: selected ? TColors.primary : TColors.neutralDarkMedium,
        ),
        const TextHeading5(
          "Transfer Bank",
          color: TColors.neutralDarkMedium,
        ),
      ],
    );
  }
}

class QrisPaymentRadioContent extends StatelessWidget {
  final bool selected;

  const QrisPaymentRadioContent({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      TImages.qrisLogo,
      height: 19.28,
      width: 120,
      colorFilter: ColorFilter.mode(
        selected ? TColors.primary : TColors.neutralDarkMedium,
        BlendMode.srcIn,
      ),
    );
  }
}

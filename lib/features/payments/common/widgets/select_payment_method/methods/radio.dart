import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/constants/payment_method_strings.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
          child: ResponsiveLayout(
            mobile: switch (value) {
              "CASH" => CashPaymentRadioContent(selected: selected),
              "BANK_TRANSFER" =>
                BankTransferPaymentRadioContent(selected: selected),
              "QR_CODE" => QrisPaymentRadioContent(selected: selected),
              "DEBIT" => DebitPaymentRadioContent(selected: selected),
              _ => const SizedBox(),
            },
            tablet: Center(
              child: switch (value) {
                "CASH" => CashPaymentRadioContent(selected: selected),
                "BANK_TRANSFER" =>
                  BankTransferPaymentRadioContent(selected: selected),
                "QR_CODE" => QrisPaymentRadioContent(selected: selected),
                "DEBIT" => DebitPaymentRadioContent(selected: selected),
                _ => const SizedBox(),
              },
            ),
          ),
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
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment:
          isMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        UiIcons(
          TIcons.moneyBill,
          size: 24,
          color: selected ? TColors.primary : TColors.neutralDarkMedium,
        ),
        const SizedBox(width: 12),
        Flexible(
          fit: FlexFit.loose,
          child: TextHeading5(
            TPaymentMethodName.cash,
            color: selected ? TColors.primary : TColors.neutralDarkMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

class DebitPaymentRadioContent extends StatelessWidget {
  final bool selected;

  const DebitPaymentRadioContent({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment:
          isMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        UiIcons(
          TIcons.creditCard,
          size: 24,
          color: selected ? TColors.primary : TColors.neutralDarkMedium,
        ),
        const SizedBox(width: 12),
        Flexible(
          fit: FlexFit.loose,
          child: TextHeading5(
            TPaymentMethodName.debit,
            color: selected ? TColors.primary : TColors.neutralDarkMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

class BankTransferPaymentRadioContent extends StatelessWidget {
  final bool selected;

  const BankTransferPaymentRadioContent({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment:
          isMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        UiIcons(
          TIcons.moneyBillTransfer,
          size: 24,
          color: selected ? TColors.primary : TColors.neutralDarkMedium,
        ),
        const SizedBox(width: 12),
        Flexible(
          fit: FlexFit.loose,
          child: TextHeading5(
            TPaymentMethodName.bankTransfer,
            color: selected ? TColors.primary : TColors.neutralDarkMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

class QrisPaymentRadioContent extends StatelessWidget {
  final bool selected;

  const QrisPaymentRadioContent({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        TImages.qrisLogo,
        height: 20,
        width: 120,
        colorFilter: ColorFilter.mode(
          selected ? TColors.primary : TColors.neutralDarkMedium,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

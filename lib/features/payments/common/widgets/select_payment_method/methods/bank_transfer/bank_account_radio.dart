import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/payments/data/models/bank_account_model.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/helpers/helper.dart';

class BankAccountRadio extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;
  final BankAccountModel account;

  const BankAccountRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    bool selected = value == groupValue;

    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: selected ? TColors.primary : TColors.neutralLightMedium,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  THelper.getBankImage(account.bankName),
                  height: 32,
                  width: 32,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextHeading4(
                        THelper.getBankName(account.bankName),
                        color: TColors.neutralDarkDarkest,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      TextBodyS(
                        "${account.number} • A/n ${account.name}",
                        color: TColors.neutralDarkLightest,
                      ),
                    ],
                  ),
                ),
              ],
            )),
            SizedBox(
              height: 16,
              width: 16,
              child: Radio<String>(
                groupValue: groupValue,
                value: value,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

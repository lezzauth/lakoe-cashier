import 'package:flutter/material.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:lakoe_pos/common/widgets/form/custom_radio.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class BankAccountRadio extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;
  final OwnerBankModel account;

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
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextHeading4(
                          account.name,
                          color: TColors.neutralDarkDarkest,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        TextBodyS(
                          "${account.accountNumber} • ${account.accountName.toUpperCase()}",
                          color: TColors.neutralDarkLightest,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            CustomRadio(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}

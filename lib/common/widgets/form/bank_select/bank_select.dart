import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/form/bank_select/bank_select_list.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class BankSelect extends StatefulWidget {
  const BankSelect({
    super.key,
    this.value = "",
    this.hintText = "",
    this.errorText = "",
    required this.onChanged,
  });

  final String value;
  final ValueChanged<String> onChanged;
  final String hintText;
  final String errorText;

  @override
  State<BankSelect> createState() => _BankSelectState();
}

class _BankSelectState extends State<BankSelect> {
  @override
  Widget build(BuildContext context) {
    bool hasError = widget.errorText.isNotEmpty;

    return Ink(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () async {
              await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                useSafeArea: true,
                builder: (context) {
                  return BankSelectList(
                    initialValue: widget.value,
                    onChanged: (value) {
                      Navigator.pop(context);
                      widget.onChanged(value!);
                    },
                  );
                },
              );
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 1,
                  color:
                      !hasError ? TColors.neutralLightDarkest : TColors.error,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Row(
                children: [
                  Expanded(
                    child: TextBodyM(
                      widget.value.isEmpty ? widget.hintText : widget.value,
                      color: widget.value.isEmpty
                          ? TColors.neutralDarkLightest
                          : TColors.neutralDarkDarkest,
                    ),
                  ),
                  const UiIcons(
                    TIcons.arrowDown,
                    color: TColors.neutralDarkLightest,
                    height: 12,
                    width: 12,
                  )
                ],
              ),
            ),
          ),
          if (hasError)
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.only(left: 14),
              child: TextBodyS(
                widget.errorText,
                color: TColors.error,
              ),
            ),
        ],
      ),
    );
  }
}
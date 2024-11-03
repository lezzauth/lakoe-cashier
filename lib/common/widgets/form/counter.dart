import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class Counter extends StatelessWidget {
  const Counter({
    super.key,
    required this.value,
    this.minValue = 1,
    required this.onChanged,
    this.isDeletable = true,
  });

  final ValueChanged<int> onChanged;
  final int value;
  final int minValue;
  final bool isDeletable;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColors.neutralLightLightest,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: TColors.highlightMedium,
          width: 1,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      height: 36,
      child: Row(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: (value <= 1 && isDeletable == true)
                ? () => onChanged(value - 1)
                : (minValue > 1 && isDeletable == false)
                    ? null
                    : () => onChanged(value - 1),
            child: Container(
              decoration: BoxDecoration(
                color: TColors.neutralLightLight,
                borderRadius: BorderRadius.circular(8.0),
              ),
              width: 36,
              height: 36,
              child: Center(
                child: (value <= 1 && isDeletable == true)
                    ? UiIcons(
                        TIcons.trash,
                        size: 16,
                        color: TColors.error,
                      )
                    : (minValue > 1 && isDeletable == false)
                        ? UiIcons(
                            TIcons.minus,
                            size: 16,
                            color: TColors.highlightMedium,
                          )
                        : UiIcons(
                            TIcons.minus,
                            size: 16,
                            color: TColors.primary,
                          ),
              ),
            ),
          ),
          SizedBox(
            height: 36,
            width: 36,
            child: Center(
              child: Text(
                value.toString(),
                style: GoogleFonts.inter(
                  fontSize: TSizes.fontSizeActionL,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => onChanged(value + 1),
            child: Container(
              decoration: BoxDecoration(
                color: TColors.neutralLightLight,
                borderRadius: BorderRadius.circular(8.0),
              ),
              width: 36,
              height: 36,
              child: UiIcons(
                TIcons.add,
                size: 16,
                color: TColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
    required this.onChanged,
  });

  final ValueChanged<int> onChanged;
  final int value;

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
      height: 36,
      child: Row(
        children: [
          SizedBox(
            width: 36,
            height: 36,
            child: (value <= 1)
                ? UiIcons(
                    TIcons.trash,
                    height: 16,
                    width: 16,
                    color: TColors.error,
                    onTap: () {
                      onChanged(value - 1);
                    },
                  )
                : UiIcons(
                    TIcons.minus,
                    height: 14,
                    width: 14,
                    color: TColors.primary,
                    onTap: () {
                      onChanged(value - 1);
                    },
                  ),
            // child: IconButton(
            //   onPressed: () {
            //     onChanged(value - 1);
            //   },
            //   icon: (value <= 1)
            //       ? const UiIcons(
            //           TIcons.trash,
            //           height: 16,
            //           width: 16,
            //           color: TColors.error,
            //         )
            //       : const Icon(
            //           Icons.remove,
            //           size: 16,
            //           color: TColors.primary,
            //         ),
            // ),
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
          SizedBox(
            width: 36,
            height: 36,
            child: UiIcons(
              TIcons.add,
              height: 16,
              width: 16,
              color: TColors.primary,
              onTap: () {
                onChanged(value + 1);
              },
            ),
          ),
        ],
      ),
    );
  }
}

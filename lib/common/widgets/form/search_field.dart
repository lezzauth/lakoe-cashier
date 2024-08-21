import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.hintText,
    this.controller,
  });

  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 40,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        color: TColors.neutralLightMedium,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const UiIcons(
            TIcons.search,
            height: 20,
            width: 20,
            color: TColors.neutralDarkLight,
          ),
          const SizedBox(width: 12),
          Flexible(
            child: SizedBox(
              height: 22,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                  ),
                  contentPadding: EdgeInsets.zero,
                  hintText: hintText,
                  labelStyle: GoogleFonts.inter(fontSize: TSizes.fontSizeBodyL),
                ),
                style: GoogleFonts.inter(fontSize: TSizes.fontSizeBodyL),
              ),
            ),
          )
        ],
      ),
    );
  }
}

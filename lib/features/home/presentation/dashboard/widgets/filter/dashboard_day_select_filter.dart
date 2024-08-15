import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class DashboardDaySelectFilter extends StatefulWidget {
  const DashboardDaySelectFilter({super.key});

  @override
  State<DashboardDaySelectFilter> createState() =>
      _DashboardDaySelectFilterState();
}

class _DashboardDaySelectFilterState extends State<DashboardDaySelectFilter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: const UiIcons(
              TIcons.arrowLeft,
              height: 16,
              width: 16,
            ),
          ),
          Text(
            "Sabtu, 17 Agustus 2024",
            style: GoogleFonts.inter(
              color: TColors.neutralDarkDarkest,
              fontSize: TSizes.fontSizeBodyM,
            ),
          ),
          GestureDetector(
            child: const UiIcons(
              TIcons.arrowRight,
              height: 16,
              width: 16,
            ),
          ),
        ],
      ),
    );
  }
}

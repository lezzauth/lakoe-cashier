import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';

class ItemMenu extends StatelessWidget {
  final String icon;
  final String label;
  final Color color;
  final String routeName;

  const ItemMenu(
      {super.key,
      required this.icon,
      required this.label,
      required this.color,
      required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                icon,
                height: 28,
                width: 28,
              ),
              SizedBox(height: 8),
              Text(
                label,
                style: GoogleFonts.inter(
                  color: TColors.neutralDarkMedium,
                  fontWeight: FontWeight.w600,
                  fontSize: TSizes.fontSizeHeading4,
                ),
              )
            ],
          ),
        ),

        // Column(
        //   children: [
        //     Container(
        //       height: 60.75,
        //       width: 60.75,
        //       margin: const EdgeInsets.only(bottom: 8.0),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(60.75),
        //         color: color,
        //       ),
        //       child: Center(
        //         child: SvgPicture.asset(
        //           icon,
        //           height: 24,
        //           width: 24,
        //         ),
        //       ),
        //     ),
        //     Text(
        //       label,
        //       style: GoogleFonts.inter(
        //         color: TColors.neutralDarkMedium,
        //         fontWeight: FontWeight.w600,
        //         fontSize: TSizes.fontSizeHeading5,
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}

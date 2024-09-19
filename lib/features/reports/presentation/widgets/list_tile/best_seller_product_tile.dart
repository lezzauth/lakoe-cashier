import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class BestSellerProductTile extends StatelessWidget {
  const BestSellerProductTile({
    super.key,
    required this.imageSrc,
    required this.sold,
    required this.name,
    required this.rank,
    this.onTap,
  });

  final String imageSrc;
  final int sold;
  final String name;
  final int rank;
  final Function()? onTap;

  Widget _buildRank() {
    String icon = "";

    switch (rank) {
      case 1:
        icon = "🔥";
        break;
      case 2:
        icon = "👏";
        break;
      case 3:
        icon = "👍";
        break;
      default:
    }

    if (rank <= 3) {
      return Text(
        "$icon #$rank",
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w900,
          color: TColors.neutralDarkMedium,
          fontSize: 12,
        ),
      );
    }

    return TextHeading5("#$rank");
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      leading: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.network(
          imageSrc,
          height: 44,
          width: 44,
          fit: BoxFit.cover,
        ),
      ),
      title: TextHeading4(
        name,
        color: TColors.neutralDarkDarkest,
      ),
      subtitle: TextBodyM(
        "Terjual $sold item",
        color: TColors.neutralDarkLight,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildRank(),
          Container(
            margin: const EdgeInsets.only(left: 12),
            child: const UiIcons(
              TIcons.arrowRight,
              height: 12,
              width: 12,
              color: TColors.primary,
            ),
          )
        ],
      ),
    );
  }
}

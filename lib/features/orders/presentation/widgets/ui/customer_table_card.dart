import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:order_repository/order_repository.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/cards/card_order.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

class CustomerAndTableInformation extends StatelessWidget {
  const CustomerAndTableInformation({
    super.key,
    this.order,
    this.customer,
    this.table,
  });

  final dynamic order;
  final OrderCustomer? customer;
  final OrderTable? table;

  void detailContextIcon(BuildContext context, String type) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CustomBottomsheet(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      type == "DINEIN" ? TIcons.servingDome : TIcons.bag,
                      height: 32,
                      colorFilter: ColorFilter.mode(
                        TColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextHeading3(
                      type == "DINEIN" ? "DINE-IN" : "TAKE AWAY",
                      color: TColors.neutralDarkDark,
                    ),
                    SizedBox(height: 4),
                    TextBodyM(
                      type == "DINEIN"
                          ? "Layanan untuk pelanggan yang menikmati makanan atau minuman langsung di tempat."
                          : "Layanan untuk pelanggan yang membeli makanan atau minuman untuk dibawa pulang (dibungkus).",
                      color: TColors.neutralDarkDark,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: TextActionL("Oke! Paham"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: CardOrder(
            isReadOnly: true,
            title: "Pelanggan",
            subTitle: customer == null ? "Tamu" : customer!.name,
            icon: const UiIcons(
              TIcons.profile,
              size: 20,
              color: TColors.primary,
            ),
          ),
        ),
        SizedBox(width: 12.0),
        Flexible(
          flex: 1,
          child: CardOrder(
            isReadOnly: true,
            title: "Meja",
            subTitle: table == null ? "Bebas" : table!.no,
            icon: UiIcons(
              TIcons.tableRestaurant,
              size: 20,
              color: TColors.primary,
            ),
            trailing: (order.type == "DINEIN")
                ? UiIcons(
                    TIcons.servingDome,
                    size: 20,
                    color: TColors.neutralDarkDark,
                    onTap: () => detailContextIcon(context, order.type),
                  )
                : UiIcons(
                    TIcons.bag,
                    size: 20,
                    color: TColors.neutralDarkDark,
                    onTap: () => detailContextIcon(context, order.type),
                  ),
          ),
        ),
      ],
    );
  }
}

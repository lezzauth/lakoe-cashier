import 'package:flutter/material.dart';
import 'package:online_shop_repository/online_shop_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';
import 'package:point_of_sales_cashier/utils/helpers/helper.dart';

class OrderInfoSection extends StatefulWidget {
  const OrderInfoSection({super.key, required this.order});

  final OrderDetailModel order;

  @override
  State<OrderInfoSection> createState() => _OrderInfoSectionState();
}

class _OrderInfoSectionState extends State<OrderInfoSection> {
  Future<void> _onCopy({required String title, required String text}) async {
    await THelper.copyToClipboard(text);

    if (!mounted) return;
    SnackBar snackBar = SnackBar(
      content: Text(title),
      showCloseIcon: true,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        snackBar,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          _SectionItem(
            trailingText: "${TFormatter.orderDate(
              widget.order.createdAt.toIso8601String(),
            )} WIB",
            icon: TIcons.calendar2,
            title: "Tanggal",
          ),
          _SectionItem(
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 12,
                  ),
                  child: UiIcons(
                    TIcons.copy,
                    height: 20,
                    width: 20,
                    onTap: () {
                      _onCopy(
                        text: widget.order.invoiceNumber,
                        title: "Nomor invoice berhasil disalin",
                      );
                    },
                  ),
                ),
                Flexible(
                  child: TextBodyM(
                    widget.order.invoiceNumber,
                    color: TColors.neutralDarkLight,
                    textAlign: TextAlign.end,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            icon: TIcons.barcode,
            title: "Invoice",
          ),
          _SectionItem(
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 12,
                  ),
                  child: GestureDetector(
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: TColors.success,
                      ),
                      child: Center(
                        child: UiIcons(
                          TIcons.whatsappSolid,
                          height: 16,
                          width: 16,
                          color: TColors.neutralLightLightest,
                          onTap: () {
                            THelper.openWhatsappNumber(
                              widget.order.shipment.destinationContactPhone,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: TextBodyM(
                    widget.order.shipment.destinationContactName,
                    color: TColors.neutralDarkLight,
                    textAlign: TextAlign.end,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            icon: TIcons.profileCircle,
            title: "Pembeli",
          ),
        ],
      ),
    );
  }
}

class _SectionItem extends StatelessWidget {
  const _SectionItem({
    this.trailing,
    this.trailingText = "",
    required this.icon,
    this.title = "",
  });

  final Widget? trailing;
  final String trailingText;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: UiIcons(
              icon,
              color: TColors.primary,
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextHeading4(title),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 12),
                    child: trailing ??
                        TextBodyM(
                          trailingText,
                          color: TColors.neutralDarkLight,
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

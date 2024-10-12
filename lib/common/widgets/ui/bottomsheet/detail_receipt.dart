import 'package:flutter/material.dart';
import 'package:order_repository/order_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/widgets/bill_view.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class DetailReceiptBottomSheet extends StatelessWidget {
  const DetailReceiptBottomSheet({
    super.key,
    required this.controller,
    required this.widgetKey,
    required this.data,
    required this.saveAction,
    required this.shareAction,
  });
  final ScrollController controller;
  final GlobalKey widgetKey;
  final OrderModel data;
  final Function() saveAction;
  final Function() shareAction;

  @override
  Widget build(BuildContext context) {
    return CustomBottomsheet(
      child: Expanded(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: TColors.neutralLightMedium,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const TextHeading2("Tampilan Struk"),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: TColors.neutralLightLight,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  controller: controller,
                  child: RepaintBoundary(
                    key: widgetKey,
                    child: Column(
                      children: [
                        BillView(
                          outletName: "Warmindo Cak Tho",
                          outletAddress: "Tebet,Jakarta Selatan, DKI Jakarta",
                          noBill: "LK-0001",
                          order: data,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: TColors.neutralLightMedium,
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: saveAction,
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UiIcons(
                            TIcons.download,
                            width: 20,
                            height: 20,
                            color: TColors.primary,
                          ),
                          SizedBox(width: 8),
                          const TextActionL(
                            "Unduh",
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => print("Print"),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UiIcons(
                            TIcons.printer,
                            width: 20,
                            height: 20,
                            color: TColors.primary,
                          ),
                          SizedBox(width: 8),
                          const TextActionL(
                            "Print",
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: shareAction,
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UiIcons(
                            TIcons.share,
                            width: 20,
                            height: 20,
                            color: TColors.primary,
                          ),
                          SizedBox(width: 8),
                          const TextActionL(
                            "Bagikan",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

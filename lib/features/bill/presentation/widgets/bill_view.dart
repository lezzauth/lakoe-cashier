import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/bill/text_small.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/screens/bill_master.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/widgets/section/section_heading.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/widgets/section/section_list_item.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/widgets/section/section_price_info.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class BillView extends StatelessWidget {
  final String outletName;
  final String outletAddress;
  final String orderNumber;
  final String cashierName;
  final String noBill;
  final String orderType;
  final String noTable;
  final String dateTime;
  final String paymentMetod;
  final String totalPrice;
  final String moneyReceived;
  final String changeMoney;
  final List<Widget> children;
  final String? closeBill;
  final String greeting;
  final bool isEdit;

  const BillView({
    super.key,
    required this.outletName,
    required this.outletAddress,
    required this.orderNumber,
    required this.cashierName,
    required this.noBill,
    required this.orderType,
    required this.noTable,
    required this.dateTime,
    required this.paymentMetod,
    required this.totalPrice,
    required this.moneyReceived,
    required this.changeMoney,
    required this.children,
    this.closeBill,
    required this.greeting,
    this.isEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Center(
        child: Container(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: isEdit == false
                ? TColors.neutralLightLightest
                : TColors.neutralLightLight,
            border: Border.all(
              color: TColors.neutralLightMedium,
              width: isEdit == false ? 0.0 : 1.0,
            ),
          ),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 4.0,
            children: [
              BillSectionHeading(
                outletName: outletName,
                outletAddress: outletAddress,
                orderNumber: orderNumber,
              ),
              SectionBillInformation(
                cashierName: cashierName,
                noBill: noBill,
                orderType: orderType,
                noTable: noTable,
                dateTime: dateTime,
              ),
              const BillSectionListItem(),
              BillPriceInfo(
                paymentMetod: paymentMetod,
                totalPrice: totalPrice,
                moneyReceived: moneyReceived,
                changeMoney: changeMoney,
                children: children,
              ),
              closeBill != null
                  ? SizedBox(
                      child: TextSmall(
                        closeBill!,
                        isBold: true,
                      ),
                    )
                  : const SizedBox(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Separator(
                  color: TColors.neutralDarkDarkest,
                  height: 0.5,
                  dashWidth: 4.0,
                ),
              ),
              BillGreeting(
                greeting: greeting,
              ),
              const SizedBox(height: 52),
              const SizedBox(
                width: double.infinity,
                child: TextSmall(
                  "Supported by",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                child: SvgPicture.asset(
                  TImages.primaryLogoLakoe,
                  height: 12,
                  // ignore: deprecated_member_use
                  color: TColors.neutralDarkDarkest,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

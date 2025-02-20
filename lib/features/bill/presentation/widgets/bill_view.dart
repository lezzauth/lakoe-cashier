import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/utils/print/bill_localization.dart';
import 'package:order_repository/order_repository.dart';
import 'package:lakoe_pos/common/widgets/ui/separator/separator.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/bill/text_small.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:lakoe_pos/features/bill/application/cubit/bill_master/bill_master_cubit.dart';
import 'package:lakoe_pos/features/bill/application/cubit/bill_master/bill_master_state.dart';
import 'package:lakoe_pos/features/bill/presentation/screens/bill_master.dart';
import 'package:lakoe_pos/features/bill/presentation/widgets/section/section_heading.dart';
import 'package:lakoe_pos/features/bill/presentation/widgets/section/section_list_item.dart';
import 'package:lakoe_pos/features/bill/presentation/widgets/section/section_charges.dart';
import 'package:lakoe_pos/features/orders/data/models.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/constants/payment_method_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class BillView extends StatelessWidget {
  final bool isEdit;
  final OrderModel order;

  const BillView({
    super.key,
    this.isEdit = false,
    required this.order,
  });

  double _getOrderTotal(OrderModel order) {
    return order.items.fold(0, (sum, item) {
      return sum + double.parse(item.price);
    });
  }

  Map<String, dynamic> _getPaymentInfo(Transactions payment) {
    double paidAmount = 0.0;
    if (payment.paidAmount.isNotEmpty) {
      paidAmount = double.tryParse(payment.paidAmount) ?? 0.0;
    }

    double changeAmount = 0.0;
    if (payment.change.isNotEmpty) {
      changeAmount = double.tryParse(payment.change) ?? 0.0;
    }

    return {
      'paidAmount': paidAmount,
      'paymentMethod': TPaymentMethodName.getName(
        payment.paymentMethod,
        payment.paidFrom,
      ),
      'change': changeAmount,
    };
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> paymentDetails = {};

    paymentDetails = _getPaymentInfo(order.transactions![0]);
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth > 400 ? 400 : screenWidth;

    return BlocBuilder<BillMasterCubit, BillMasterState>(
        builder: (context, state) {
      final String langCode = state.receiptLanguage;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
            width: containerWidth,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 4.0,
              children: [
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthReady) {
                      String outletName = state.profile.outlets.first.name;
                      String outletAddress =
                          state.profile.outlets.first.address;

                      String orderNumber =
                          (order.no == 0) ? "21" : "${order.no}";

                      return Column(
                        children: [
                          BillSectionHeading(
                            outletName: outletName,
                            outletAddress: outletAddress,
                            orderNumber: orderNumber,
                            orderType: order.type,
                            noTable: order.table?.no,
                          ),
                          SectionBillInformation(
                            cashierName: order.cashier!.operator.name,
                            noBill: TFormatter.formatBillNumber(
                              order.closedAt!,
                              outletName,
                              isPreview: true,
                            ),
                            orderDate: TFormatter.billDate(order.createdAt),
                          ),
                        ],
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
                BillSectionListItem(
                  items: order.items,
                  subtotal: _getOrderTotal(order),
                ),
                BillSectionCharges(
                  paymentMethod: paymentDetails['paymentMethod'],
                  totalPrice: order.transactions![0].amount,
                  moneyReceived: paymentDetails['paidAmount'].toString(),
                  approvalCode: order.transactions![0].approvalCode,
                  changeMoney: paymentDetails['change'].toString(),
                  charges: order.charges!
                      .map((e) => OrderSummaryChargeModel(
                            type: e.type,
                            name: e.name,
                            amount: e.amount,
                            isPercentage: e.isPercentage,
                            percentageValue: e.percentageValue.toString(),
                          ))
                      .toList(),
                  // children: children,
                ),
                order.closedAt!.isNotEmpty
                    ? SizedBox(
                        child: TextSmall(
                          "${BillLocalization.getText('closeBill', langCode)}: ${TFormatter.billDate(order.closedAt!)}",
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
                TextSmall(
                  state.footNote,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 52),
                SizedBox(
                  width: double.infinity,
                  child: TextSmall(
                    BillLocalization.getText('supportBy', langCode),
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
    });
  }
}

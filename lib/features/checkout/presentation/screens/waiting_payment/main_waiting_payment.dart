import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/checkout/data/arguments/purchase_argument.dart';
import 'package:lakoe_pos/features/checkout/presentation/screens/waiting_payment/ewallet_waiting_payment.dart';
import 'package:lakoe_pos/features/checkout/presentation/screens/waiting_payment/virtual_account_waiting_payment.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:logman/logman.dart';
import 'package:owner_repository/owner_repository.dart';

class PaymentWaitingScreen extends StatefulWidget {
  const PaymentWaitingScreen({super.key, required this.arguments});

  final PurchaseArgument arguments;

  @override
  State<PaymentWaitingScreen> createState() => _PaymentWaitingScreenState();
}

class _PaymentWaitingScreenState extends State<PaymentWaitingScreen> {
  @override
  Widget build(BuildContext context) {
    Logman.instance.info("XXX ${widget.arguments.purchases}");

    PurchaseDetail purchases = widget.arguments.purchases;
    PurchaseModel purchase = purchases.purchase;

    bool isPro = purchase.packageName == "PRO";
    bool isGrow = purchase.packageName == "GROW";
    String paymentMethodType = purchases.paymentRequest.paymentMethod.type;

    return PopScope(
      onPopInvokedWithResult: (popDisposition, popResult) async {
        if (widget.arguments.previousScreen == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/home",
                (route) => false,
              );
            }
          });
          return Future.value(null);
        }
      },
      child: Scaffold(
          backgroundColor: TColors.neutralLightLight,
          appBar: CustomAppbar(
            title: "Selesaikan Pembayaran",
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                children: [
                  (paymentMethodType == "VIRTUAL_ACCOUNT")
                      ? VirtualAccountWaitingPayment(
                          arguments: widget.arguments)
                      : EwalletWaitingPayment(arguments: widget.arguments),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: TColors.neutralLightLightest,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHeading3(
                          "Detail Pembelian",
                          color: TColors.neutralDarkDarkest,
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: TColors.neutralLightLightest,
                            border: Border.all(
                              color: TColors.neutralLightMedium,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: isGrow
                                    ? TColors.successLight
                                    : isPro
                                        ? Color(0xFFF4DEF8)
                                        : TColors.highlightLightest,
                                child: Image.asset(
                                  isGrow
                                      ? TImages.growIcon
                                      : isPro
                                          ? TImages.proIcon
                                          : TImages.liteIcon,
                                  height: 32,
                                  width: 32,
                                ),
                              ),
                              SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextHeading4(
                                    "Lakoe ${TFormatter.capitalizeEachWord(purchase.packageName)}",
                                    color: TColors.neutralDarkDark,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Row(
                                    children: [
                                      TextBodyS(
                                        "Masa aktif:",
                                        color: TColors.neutralDarkLightest,
                                      ),
                                      SizedBox(width: 4),
                                      TextBodyS(
                                        (purchase.period == 12)
                                            ? "1 Tahun"
                                            : "${purchase.period} Bulan",
                                        color: TColors.neutralDarkMedium,
                                        fontWeight: FontWeight.w600,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

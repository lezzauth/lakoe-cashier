import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/checkout/application/purchase_cubit.dart';
import 'package:lakoe_pos/features/checkout/application/purchase_state.dart';
import 'package:lakoe_pos/features/checkout/data/arguments/purchase_argument.dart';
import 'package:lakoe_pos/features/checkout/data/payment_method_model.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:lakoe_pos/utils/helpers/helper.dart';
import 'package:logman/logman.dart';
import 'package:owner_repository/owner_repository.dart';

class EwalletWaitingPayment extends StatefulWidget {
  const EwalletWaitingPayment({super.key, required this.arguments});

  final PurchaseArgument arguments;

  @override
  State<EwalletWaitingPayment> createState() => _EwalletWaitingPaymentState();
}

class _EwalletWaitingPaymentState extends State<EwalletWaitingPayment>
    with SingleTickerProviderStateMixin {
  bool _checkStatusPayment = false;

  Timer? _pollingTimer;
  late Timer _timer;
  late DateTime _targetTime;
  String _remainingTime = "00:00:00";

  PaymentMethodCheckout? selectedMethod;
  PaymentRequest? payment;
  PurchaseModel? purchase;

  @override
  void initState() {
    super.initState();
    CustomToast.init(context);
    _startCountdown();

    selectedMethod = widget.arguments.selectedMethod;
    payment = widget.arguments.purchases.paymentRequest;
    purchase = widget.arguments.purchases.purchase;
    _targetTime =
        DateTime.parse(widget.arguments.purchases.paymentRequest.created)
            .add(Duration(hours: 1));

    pollPurchaseStatus(widget.arguments.purchases.purchase.id);
  }

  @override
  void dispose() {
    _timer.cancel();
    stopPolling();
    super.dispose();
  }

  void pollPurchaseStatus(String purchaseId) {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(Duration(seconds: 10), (timer) async {
      context.read<PurchaseCubit>().findOne(purchaseId);

      final state = context.read<PurchaseCubit>().state;

      if (state is PurchaseDetailSuccess) {
        final paymentStatus = state.res.paymentRequest.status;

        if (paymentStatus == "SUCCEEDED" || paymentStatus == "FAILED") {
          stopPolling();
          Logman.instance
              .info("Polling stopped. Payment status: $paymentStatus");
        }
      }

      if (state is PurchaseDetailFailure) {
        stopPolling();
        Logman.instance.error("Polling failed: ${state.error}");
      }
    });
  }

  void stopPolling() {
    _pollingTimer?.cancel();
    Logman.instance.info("Polling has been stopped.");
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final currentTime = DateTime.now();
      final difference = _targetTime.difference(currentTime);

      if (difference.isNegative) {
        timer.cancel();
        setState(() {
          _remainingTime = "00:00:00";
        });
      } else {
        setState(() {
          int days = difference.inDays;
          int hours = difference.inHours % 24;
          int minutes = difference.inMinutes % 60;
          int seconds = difference.inSeconds % 60;

          if (days > 0) {
            _remainingTime =
                "$days Hari ${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
          } else {
            _remainingTime =
                "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int amount = payment == null ? 0 : payment!.amount;

    return MultiBlocListener(
      listeners: [
        BlocListener<PurchaseCubit, PurchaseState>(listener: (context, state) {
          if (state is PurchaseDetailSuccess) {
            String statusPayment = state.res.paymentRequest.status;
            String packageName = state.res.purchase.packageName;

            if (statusPayment == "SUCCEEDED") {
              Navigator.pushNamed(
                context,
                "/payment/success",
                arguments: {'packageName': packageName.toUpperCase()},
              );
            } else if (statusPayment == "PENDING" && _checkStatusPayment) {
              CustomToast.showWithContext(
                context,
                "Pembayaran belum diterima, nih!",
                position: "bottom",
                duration: 5,
              );
              setState(() {
                _checkStatusPayment = false;
              });
            } else if (statusPayment == "FAILED") {
              Navigator.pushNamed(
                context,
                "/payment/failed",
                arguments: {'packageName': packageName.toUpperCase()},
              );
            }
          }
        }),
      ],
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: TColors.neutralLightLightest,
              border: Border.all(
                color: TColors.neutralLightMedium,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBodyL(
                  "Bayar sebelum",
                  color: TColors.neutralDarkDark,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    UiIcons(
                      TIcons.timer,
                      size: 16,
                      color: TColors.error,
                    ),
                    SizedBox(
                      width: 92,
                      child: TextHeading2(
                        _remainingTime,
                        color: TColors.error,
                        fontWeight: FontWeight.w800,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: TColors.neutralLightLightest,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextBodyM(
                      "Metode Pembayaran",
                      color: TColors.neutralDarkDark,
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          width: 1,
                          color: TColors.neutralLightMedium,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          color: TColors.neutralLightLightest,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: Image.asset(
                                  selectedMethod == null
                                      ? ''
                                      : selectedMethod!.logo,
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: TextHeading4(
                                  selectedMethod == null
                                      ? '-'
                                      : selectedMethod!.name,
                                  color: TColors.neutralDarkDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextBodyM(
                      "Total Tagihan",
                      color: TColors.neutralDarkDark,
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          width: 1,
                          color: TColors.neutralLightMedium,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                TextHeading2(
                                  TFormatter.formatToRupiah(amount),
                                  color: TColors.neutralDarkDark,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                BlocBuilder<PurchaseCubit, PurchaseState>(
                    builder: (context, state) {
                  return Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            ActionPayment selectedAction;
                            selectedAction = payment!.actions.firstWhere(
                              (action) => action.urlType == "DEEPLINK",
                              orElse: () => payment!.actions.firstWhere(
                                (action) => action.urlType == "MOBILE",
                                orElse: () => payment!.actions.firstWhere(
                                  (action) => action.urlType == "WEB",
                                  orElse: () => payment!.actions.firstWhere(
                                    (action) => action.qrCode != null,
                                    orElse: () => ActionPayment(
                                      action: null,
                                      urlType: null,
                                      method: null,
                                      url: null,
                                      qrCode: null,
                                    ),
                                  ),
                                ),
                              ),
                            );
                            if (selectedAction.url != null) {
                              await THelper.openUrl(selectedAction.url!);
                            }
                          },
                          child: TextActionL("Lanjutkan Pembayaran"),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}

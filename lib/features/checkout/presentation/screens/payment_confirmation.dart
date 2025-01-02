import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/tab/tab_container.dart';
import 'package:lakoe_pos/common/widgets/ui/tab/tab_item.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/checkout/application/purchase_cubit.dart';
import 'package:lakoe_pos/features/checkout/application/purchase_state.dart';
import 'package:lakoe_pos/features/checkout/data/payment_method_model.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:lakoe_pos/utils/helpers/helper.dart';
import 'package:logman/logman.dart';
import 'package:owner_repository/owner_repository.dart';

class PaymentConfirmationScreen extends StatefulWidget {
  const PaymentConfirmationScreen({super.key});

  @override
  State<PaymentConfirmationScreen> createState() =>
      _PaymentConfirmationScreenState();
}

class _PaymentConfirmationScreenState extends State<PaymentConfirmationScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  Map<String, dynamic>? args;

  bool _checkStatusPayment = false;

  Timer? _pollingTimer;
  late Timer _timer;
  late DateTime _targetTime;
  String _remainingTime = "00:00:00";

  PaymentRequest? payment;
  PurchaseModel? purchase;

  PaymentMethodCheckout? selectedMethod;
  List<String> stepsList = [];

  @override
  void initState() {
    super.initState();
    CustomToast.init(context);
    _tabController = TabController(length: 3, vsync: this);
    _startCountdown();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null) {
      selectedMethod = args!['selectedMethod'];
      payment = args!['purchases'].paymentRequest;
      purchase = args!['purchases'].purchase;
      _targetTime = args!['purchases']
          .paymentRequest
          .paymentMethod
          .virtualAccount!
          .channelProperties
          .expiresAt;

      pollPurchaseStatus(args!['purchases'].purchase.id);
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
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

  Future<void> _onCopy({required String text}) async {
    await THelper.copyToClipboard(text);

    if (!mounted) return;
    CustomToast.showWithContext(
      context,
      "Berhasil disalin",
      icon: TIcons.copy,
      duration: 1,
    );
  }

  Widget _buildStepsText(String steps) {
    List<String> stepsList = steps.split('\n');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: stepsList
            .asMap()
            .entries
            .where((entry) => entry.value.isNotEmpty)
            .map((entry) {
          int index = entry.key;
          String step = entry.value;

          final RegExp regex = RegExp(r'\*\*(.*?)\*\*');
          final List<TextSpan> spans = [];
          int startIndex = 0;

          for (final match in regex.allMatches(step)) {
            if (match.start > startIndex) {
              spans.add(
                TextSpan(
                  text: step.substring(startIndex, match.start),
                  style: GoogleFonts.inter(
                    color: TColors.neutralDarkDark,
                    fontSize: 16.0,
                  ),
                ),
              );
            }
            spans.add(TextSpan(
              text: match.group(1)!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: TColors.neutralDarkDark,
                fontSize: 16.0,
              ),
            ));
            startIndex = match.end;
          }

          if (startIndex < step.length) {
            spans.add(
              TextSpan(
                text: step.substring(startIndex),
                style: GoogleFonts.inter(
                  color: TColors.neutralDarkDark,
                  fontSize: 16.0,
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                  child: Text(
                    '${index + 1}. ',
                    style: GoogleFonts.inter(
                      color: TColors.neutralDarkDark,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(children: spans),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String virtualAccount = payment == null
        ? ''
        : payment!.paymentMethod.virtualAccount!.channelProperties
            .virtualAccountNumber;
    int amount =
        payment == null ? 0 : payment!.paymentMethod.virtualAccount!.amount;

    return PopScope(
      onPopInvokedWithResult: (popDisposition, popResult) async {
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
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<PurchaseCubit, PurchaseState>(
              listener: (context, state) {
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
                        Wrap(
                          spacing: 4.0,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            UiIcons(
                              TIcons.hourGlass,
                              size: 16,
                              color: TColors.error,
                            ),
                            TextHeading2(
                              _remainingTime,
                              color: TColors.error,
                              fontWeight: FontWeight.w800,
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
                              "No. Virtual Account",
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
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 4,
                                      ),
                                      color: TColors.neutralLightLight,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            selectedMethod == null
                                                ? ''
                                                : selectedMethod!.logo,
                                            width: 32,
                                            height: 32,
                                          ),
                                          SizedBox(width: 12),
                                          Expanded(
                                            child: TextHeading4(
                                              selectedMethod == null
                                                  ? ''
                                                  : "Bank ${selectedMethod!.name}",
                                              color: TColors.neutralDarkDark,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 12,
                                      ),
                                      color: TColors.neutralLightLightest,
                                      child: Row(
                                        children: [
                                          TextHeading2(
                                            virtualAccount,
                                            color: TColors.neutralDarkDark,
                                          ),
                                          SizedBox(width: 8),
                                          UiIcons(
                                            TIcons.copy,
                                            size: 20,
                                            color: TColors.primary,
                                            onTap: () =>
                                                _onCopy(text: virtualAccount),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
                                        SizedBox(width: 8),
                                        UiIcons(
                                          TIcons.copy,
                                          size: 20,
                                          color: TColors.primary,
                                          onTap: () =>
                                              _onCopy(text: amount.toString()),
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
                          bool isLoading = state is PurchaseDetailInProgress &&
                              _checkStatusPayment;
                          return SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: (isLoading)
                                  ? null
                                  : () {
                                      setState(() {
                                        _checkStatusPayment = true;
                                      });
                                      context
                                          .read<PurchaseCubit>()
                                          .findOne(purchase!.id);
                                    },
                              child: (isLoading)
                                  ? SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: CircularProgressIndicator(
                                        color: TColors.primary,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : TextActionL("Cek Status Pembayaran"),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        useSafeArea: true,
                        isScrollControlled: true,
                        builder: (context) {
                          final screenHeight =
                              MediaQuery.of(context).size.height;

                          final customHeight = screenHeight * 0.324;

                          return CustomBottomsheet(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 16,
                                  ),
                                  child: const TextHeading2(
                                    "Cara bayar tagihan",
                                  ),
                                ),
                                TabContainer(
                                  controller: _tabController,
                                  tabs: selectedMethod!.paymentMedia
                                      .map((e) => TabItem(title: e.mediaName))
                                      .toList(),
                                ),
                                SizedBox(
                                  height: customHeight,
                                  child: TabBarView(
                                    controller: _tabController,
                                    children: selectedMethod!.paymentMedia
                                        .map(
                                          (e) => _buildStepsText(e.steps),
                                        )
                                        .toList(),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  child: OutlinedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: TextActionL("Oke! Paham"),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: TextActionL("Lihat Cara Bayar"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/separator/separator.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_1.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/checkout/application/purchase_cubit.dart';
import 'package:lakoe_pos/features/checkout/application/purchase_state.dart';
import 'package:lakoe_pos/features/checkout/data/arguments/purchase_argument.dart';
import 'package:lakoe_pos/features/checkout/data/payment_method.dart';
import 'package:lakoe_pos/features/checkout/data/payment_method_model.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_detail/package_detail_cubit.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_detail/package_detail_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:lakoe_pos/utils/helpers/helper.dart';
import 'package:logman/logman.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:package_repository/package_repository.dart';

class DetailPurchaseScreen extends StatelessWidget {
  const DetailPurchaseScreen({super.key, required this.arg});

  final PurchaseModel arg;

  @override
  Widget build(BuildContext context) {
    return DetailPurchase(arg: arg);
  }
}

class DetailPurchase extends StatefulWidget {
  const DetailPurchase({super.key, required this.arg});

  final PurchaseModel arg;

  @override
  State<DetailPurchase> createState() => _DetailPurchaseState();
}

class _DetailPurchaseState extends State<DetailPurchase> {
  PackagePriceModel? selectedPackage;

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  Future<void> _onInit() async {
    context.read<PurchaseCubit>().findOne(widget.arg.id);
    context.read<PackageDetailCubit>().findOne(widget.arg.packageName);
  }

  Future<void> _onRefresh() async {
    context.read<PurchaseCubit>().findOne(widget.arg.id);
    await context.read<PackageDetailCubit>().findOne(widget.arg.packageName);
  }

  String getNamePaymentMethod(String paymentMethod) {
    switch (paymentMethod) {
      case "OVO":
        return "OVO";
      case "DANA":
        return "DANA";
      case "SHOPEEPAY":
        return "ShopeePay";
      case "LINKAJA":
        return "LinkAja";
      default:
        return "$paymentMethod - VA";
    }
  }

  String getTagLabel(String status) {
    switch (status) {
      case "PENDING":
        return "Pending";
      case "SUCCEEDED":
        return "Sukses";
      case "FAILED":
        return "Gagal";
      default:
        return "-";
    }
  }

  Color getTagBackgroundColor(String status) {
    switch (status) {
      case "PENDING":
        return TColors.warning;
      case "SUCCEEDED":
        return TColors.success;
      case "FAILED":
        return TColors.error;
      default:
        return TColors.neutralDarkDark;
    }
  }

  Color getTagTextColor(String status) {
    switch (status) {
      case "PENDING":
        return TColors.neutralDarkDark;
      case "SUCCEEDED":
        return TColors.neutralLightLightest;
      case "FAILED":
        return TColors.neutralLightLightest;
      default:
        return TColors.neutralLightLightest;
    }
  }

  Future<void> _handlePayment(
    PaymentRequest paymentRequest,
    PurchaseModel purchase,
    String paymentName,
  ) async {
    if (paymentRequest.paymentMethod.type == "EWALLET") {
      ActionPayment selectedAction;
      selectedAction = paymentRequest.actions.firstWhere(
        (action) => action.urlType == "DEEPLINK",
        orElse: () => paymentRequest.actions.firstWhere(
          (action) => action.urlType == "MOBILE",
          orElse: () => paymentRequest.actions.firstWhere(
            (action) => action.urlType == "WEB",
            orElse: () => paymentRequest.actions.firstWhere(
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
        _gotoWaitingPayment(paymentRequest, purchase, paymentName);
      }
    } else if (paymentRequest.paymentMethod.type == "VIRTUAL_ACCOUNT") {
      _gotoWaitingPayment(paymentRequest, purchase, paymentName);
    }
  }

  Future<void> _gotoWaitingPayment(
    PaymentRequest paymentRequest,
    PurchaseModel purchase,
    String paymentName,
  ) async {
    PaymentMethodCheckout? selectedMethod;
    PaymentCategory? selectedCategory;
    for (final category in paymentMethodPurchasePackage) {
      try {
        final method = category.methods.firstWhere(
          (method) => method.name.toUpperCase() == paymentName,
        );

        selectedMethod = method as PaymentMethodCheckout?;
        selectedCategory = category;
        break;
      } catch (e) {
        Logman.instance.error("Error finding payment method: $e");
      }
    }
    if (selectedMethod == null || selectedCategory == null) {
      Logman.instance.error("Selected method or category not found");
    }
    Navigator.pushNamed(
      context,
      "/payment/waiting",
      arguments: PurchaseArgument(
        previousScreen: "detail_purchase",
        selectedMethod: selectedMethod!,
        selectedCategory: selectedCategory!,
        purchases: PurchaseDetail(
          paymentRequest: paymentRequest,
          purchase: purchase,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isPro = widget.arg.packageName == "PRO";
    bool isGrow = widget.arg.packageName == "GROW";

    return MultiBlocListener(
      listeners: [
        BlocListener<PurchaseCubit, PurchaseState>(
            listener: (context, state) {}),
        BlocListener<PackageDetailCubit, PackageDetailState>(
            listener: (context, state) {
          if (state is PackageDetailLoadSuccess) {
            setState(() {
              selectedPackage = state.detail.firstWhere(
                (e) => e.period == widget.arg.period,
                orElse: () => PackagePriceModel(
                  name: 'LITE',
                  discount: 0,
                  period: 1,
                  save: 0,
                  originPrice: 0,
                  pricePerMonth: 0,
                  savePerMonth: 0,
                  price: 0,
                  startPeriod: DateTime.now(),
                  endPeriod: DateTime.now(),
                ),
              );
            });
          }
        }),
      ],
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (popDisposition, popResult) async {
          Navigator.pop(context, true);
        },
        child: Scaffold(
          backgroundColor: TColors.neutralLightLight,
          appBar: CustomAppbar(
            title: "Detail Pembelian",
            handleBackButton: () => Navigator.pop(context, true),
          ),
          body: BlocBuilder<PurchaseCubit, PurchaseState>(
              builder: (context, state) {
            if (state is PurchaseDetailSuccess) {
              final purchase = state.res.purchase;
              final paymentRequest = state.res.paymentRequest;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
                        decoration: BoxDecoration(
                          color: TColors.neutralLightLightest,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 32,
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
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  TextHeading1(
                                    TFormatter.formatToRupiah(
                                        paymentRequest.amount),
                                    color: TColors.neutralDarkDark,
                                  ),
                                  SizedBox(height: 4),
                                  TextBodyM(
                                    "Upgrade Paket",
                                    color: TColors.neutralDarkLightest,
                                  ),
                                ],
                              ),
                            ),
                            Separator(
                              dashWidth: 6,
                              padding: 20,
                              color: TColors.neutralLightDarkest,
                            ),
                            TextHeading3(
                              'Info Paket',
                              color: TColors.neutralDarkDark,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 12),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextBodyM(
                                    "Nama",
                                    color: TColors.neutralDarkLightest,
                                  ),
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: TextBodyM(
                                      "Lakoe ${TFormatter.capitalizeEachWord(purchase.packageName)}",
                                      color: TColors.neutralDarkMedium,
                                      fontWeight: FontWeight.w600,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextBodyM(
                                    "Masa aktif",
                                    color: TColors.neutralDarkLightest,
                                  ),
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: TextBodyM(
                                      (purchase.period == 12)
                                          ? "1 Tahun"
                                          : "${purchase.period} Bulan",
                                      color: TColors.neutralDarkMedium,
                                      fontWeight: FontWeight.w600,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextBodyM(
                                    "Harga per bulan",
                                    color: TColors.neutralDarkLightest,
                                  ),
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: TextBodyM(
                                      selectedPackage != null
                                          ? TFormatter.formatToRupiah(
                                              selectedPackage!.originPrice /
                                                  purchase.period)
                                          : '-',
                                      color: TColors.neutralDarkMedium,
                                      fontWeight: FontWeight.w600,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Separator(
                              dashWidth: 6,
                              padding: 16,
                              color: TColors.neutralLightDarkest,
                            ),
                            TextHeading3(
                              'Rincian Transaksi',
                              color: TColors.neutralDarkDark,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 12),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextBodyM(
                                    "Status",
                                    color: TColors.neutralDarkLightest,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: getTagBackgroundColor(
                                          state.res.purchase.status),
                                    ),
                                    child: TextBodyS(
                                      getTagLabel(state.res.purchase.status),
                                      color: getTagTextColor(
                                          state.res.purchase.status),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextBodyM(
                                    "Metode Pembayaran",
                                    color: TColors.neutralDarkLightest,
                                  ),
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: TextBodyM(
                                      getNamePaymentMethod(
                                          state.res.purchase.paymentMethod),
                                      color: TColors.neutralDarkMedium,
                                      fontWeight: FontWeight.w600,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextBodyM(
                                    "Tgl, Waktu",
                                    color: TColors.neutralDarkLightest,
                                  ),
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: TextBodyM(
                                      TFormatter.dateTime(
                                        state.res.purchase.createdAt,
                                        withIsToday: false,
                                        withTimeZone: false,
                                      ),
                                      color: TColors.neutralDarkMedium,
                                      fontWeight: FontWeight.w600,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Separator(
                              dashWidth: 6,
                              padding: 8,
                              color: TColors.neutralLightDarkest,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextBodyM(
                                    "Jumlah",
                                    color: TColors.neutralDarkLightest,
                                  ),
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: TextBodyM(
                                      selectedPackage != null
                                          ? TFormatter.formatToRupiah(
                                              selectedPackage!.originPrice)
                                          : '-',
                                      color: TColors.neutralDarkMedium,
                                      fontWeight: FontWeight.w600,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (selectedPackage != null &&
                                selectedPackage!.save != 0)
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextBodyM(
                                      "Diskon",
                                      color: TColors.neutralDarkLightest,
                                    ),
                                    SizedBox(width: 8),
                                    Flexible(
                                      child: TextBodyM(
                                        "-${TFormatter.formatToRupiah(selectedPackage!.save)}",
                                        color: TColors.success,
                                        fontWeight: FontWeight.w700,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            Separator(
                              dashWidth: 6,
                              padding: 8,
                              color: TColors.neutralLightDarkest,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextBodyM(
                                    "Total",
                                    color: TColors.neutralDarkDark,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: TextBodyM(
                                      TFormatter.formatToRupiah(
                                          paymentRequest.amount),
                                      color: TColors.neutralDarkMedium,
                                      fontWeight: FontWeight.w600,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (paymentRequest.status == "PENDING" ||
                                purchase.status == "PENDING")
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(double.infinity, 32),
                                    padding: EdgeInsets.all(12),
                                  ),
                                  onPressed: () {
                                    _handlePayment(
                                      paymentRequest,
                                      purchase,
                                      state.res.purchase.paymentMethod,
                                    );
                                  },
                                  child: TextActionL("Bayar & Selesaikan"),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is PurchaseDetailInProgress) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PurchaseDetailFailure) {
              return EmptyList(
                title: "Gagal memuat data, nih!",
                subTitle: "Ada sedikit gangguan. Coba coba lagi, ya",
                action: TextButton(
                  onPressed: _onRefresh,
                  child: TextActionL(
                    "Coba Lagi",
                    color: TColors.primary,
                  ),
                ),
              );
            } else {
              return EmptyList(
                title: "Bentar, ada masalah tak terduga, nih!",
                subTitle: "Tenang, kamu bisa mencobanya lagi, kok",
                action: TextButton(
                  onPressed: _onRefresh,
                  child: TextActionL(
                    "Coba Lagi",
                    color: TColors.primary,
                  ),
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}

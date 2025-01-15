import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/features/checkout/application/purchase_cubit.dart';
import 'package:lakoe_pos/features/checkout/application/purchase_state.dart';
import 'package:lakoe_pos/features/checkout/data/payment_method.dart';
import 'package:lakoe_pos/features/checkout/data/payment_method_model.dart';
import 'package:lakoe_pos/features/checkout/presentation/widget/payment_bottom_sheet.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:package_repository/package_repository.dart';

class ChekcoutMasterScreen extends StatefulWidget {
  const ChekcoutMasterScreen({super.key});

  @override
  State<ChekcoutMasterScreen> createState() => _ChekcoutMasterScreenState();
}

class _ChekcoutMasterScreenState extends State<ChekcoutMasterScreen> {
  Map<String, dynamic>? arg;
  _PackageInfoCard? selectedPackage;
  String? type;

  String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        arg =
            ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

        if (arg != null) {
          type = arg?['type'];

          selectedPackage = _PackageInfoCard(
            package: arg?['package'],
            logo: arg?['logo'] ?? TImages.growLogoPackage,
            colorWave: arg?['colorWave'] ?? Color(0xFF00712D),
            bgColor: arg?['bgColor'] ?? TColors.successLight,
            name: arg?['packageName'] ?? 'Unknown Package',
            period: arg?['period'] ?? 'Unknown',
            pricePerMonth: arg?['pricePerMonth'] ?? 0,
            totalPrice: arg?['finalPrice'] ?? 0,
          );
        }
      });
    });
  }

  void showPaymentMethodBottomSheet(
      BuildContext context,
      List<PaymentCategory> paymentCategories,
      PaymentCategory? selectedCategory,
      PaymentMethodCheckout? selectedMethod,
      Function(PaymentCategory, PaymentMethodCheckout?) onSelected) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (context) {
          return CustomBottomsheet(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: PaymentBottomSheet(
                paymentCategories: paymentCategories,
                selectedCategory: selectedCategory,
                selectedMethod: selectedMethod,
                onSelected: onSelected,
              ),
            ),
          );
        });
  }

  PaymentCategory? selectedCategory;
  PaymentMethodCheckout? selectedMethod;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PurchaseCubit, PurchaseState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppbar(
              title: "Pembelian Paket",
            ),
            body: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: selectedPackage!.bgColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                right: 0,
                                child: SvgPicture.asset(
                                  TImages.pakcageWaves,
                                  colorFilter: ColorFilter.mode(
                                    // Color(0xFF00712D),
                                    selectedPackage!.colorWave,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      selectedPackage!.logo,
                                      height: type == 'boost' ? 24 : 32,
                                    ),
                                    SizedBox(height: 16),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: TextBodyM(
                                                "Jenis Paket",
                                                color: TColors.neutralDarkDark,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: TextHeading4(
                                                "Lakoe ${capitalize(selectedPackage!.name)}",
                                                color: TColors.neutralDarkDark,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: TextBodyM(
                                                "Periode",
                                                color: TColors.neutralDarkDark,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextHeading4(
                                                    selectedPackage!.period ==
                                                            12
                                                        ? "1 Tahun"
                                                        : "${selectedPackage!.period} Bulan",
                                                    color:
                                                        TColors.neutralDarkDark,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  TextBodyS(
                                                    getFormattedDateRange(
                                                        selectedPackage!
                                                            .period),
                                                    color: TColors
                                                        .neutralDarkLight,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: TextBodyM(
                                                "Harga",
                                                color: TColors.neutralDarkDark,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextHeading4(
                                                    "${TFormatter.formatToRupiah(selectedPackage!.package!.originPrice / selectedPackage!.period)}/bulan",
                                                    color:
                                                        TColors.neutralDarkDark,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 4,
                        color: TColors.neutralLightMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextHeading3(
                              "Ringkasan Tagihan",
                              color: TColors.neutralDarkDark,
                            ),
                            SizedBox(height: 8),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextBodyM(
                                    "Subtotal",
                                    color: TColors.neutralDarkDark,
                                  ),
                                  TextBodyM(
                                    selectedPackage != null
                                        ? TFormatter.formatToRupiah(
                                            selectedPackage!
                                                .package!.originPrice)
                                        : '-',
                                    color: TColors.neutralDarkDark,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                            if (selectedPackage != null &&
                                selectedPackage!.package!.save != 0)
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        TextBodyM(
                                          "Diskon",
                                          color: TColors.neutralDarkDark,
                                        ),
                                        SizedBox(width: 8),
                                        if (selectedPackage!
                                                .package!.discount !=
                                            0)
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 6,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: TColors.errorLight,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: TextHeading5(
                                              "${selectedPackage!.package!.discount}%",
                                              color: TColors.error,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                      ],
                                    ),
                                    TextBodyM(
                                      "-${TFormatter.formatToRupiah(selectedPackage!.package!.save)}",
                                      color: TColors.success,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBodyM(
                                  "Total",
                                  color: TColors.neutralDarkDark,
                                ),
                                TextHeading3(
                                  TFormatter.formatToRupiah(
                                      selectedPackage!.totalPrice),
                                  color: TColors.neutralDarkDark,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 4,
                        color: TColors.neutralLightMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextHeading3(
                              "Metode Pembayaran",
                              color: TColors.neutralDarkDark,
                            ),
                            SizedBox(height: 12),
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                showPaymentMethodBottomSheet(
                                  context,
                                  paymentMethod,
                                  selectedCategory,
                                  selectedMethod,
                                  (PaymentCategory category,
                                      PaymentMethodCheckout? method) {
                                    setState(() {
                                      selectedCategory = category;
                                      selectedMethod = method;
                                    });
                                  },
                                );
                              },
                              child: (selectedMethod != null)
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
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
                                              padding: EdgeInsets.all(16),
                                              color: TColors.neutralLightLight,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: TextBodyM(
                                                      selectedCategory!
                                                          .categoryName,
                                                      color: TColors
                                                          .neutralDarkDark,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(16),
                                              color:
                                                  TColors.neutralLightLightest,
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    selectedMethod!.logo,
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                  SizedBox(width: 12),
                                                  Expanded(
                                                    child: TextHeading4(
                                                      selectedMethod!.name,
                                                      color: TColors
                                                          .neutralDarkDark,
                                                    ),
                                                  ),
                                                  SizedBox(width: 12),
                                                  UiIcons(
                                                    TIcons.arrowRight,
                                                    size: 16,
                                                    color: TColors
                                                        .neutralDarkLightest,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: TColors.neutralLightLightest,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          width: 1,
                                          color: TColors.neutralLightMedium,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          UiIcons(
                                            TIcons.wallet,
                                            size: 24,
                                            color: TColors.neutralDarkDark,
                                          ),
                                          SizedBox(width: 12),
                                          Expanded(
                                            child: TextHeading4(
                                              "Pilih metode pembayaran",
                                              color: TColors.neutralDarkDark,
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          UiIcons(
                                            TIcons.arrowRight,
                                            size: 16,
                                            color: TColors.neutralDarkLightest,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBodyM(
                            "Total",
                            color: TColors.neutralDarkLight,
                          ),
                          TextHeading2(
                            TFormatter.formatToRupiah(
                                selectedPackage!.totalPrice),
                            color: TColors.neutralDarkDark,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed:
                            selectedMethod == null || selectedPackage == null
                                ? null
                                : () {
                                    Navigator.pushNamed(
                                      context,
                                      "/payment/prepared",
                                      arguments: {
                                        'package': selectedPackage,
                                        'selectedCategory': selectedCategory,
                                        'selectedMethod': selectedMethod,
                                      },
                                    );
                                  },
                        style: ButtonStyle(
                          minimumSize: WidgetStateProperty.all(
                            Size(160, 0),
                          ),
                        ),
                        child: Row(
                          children: [
                            UiIcons(
                              TIcons.shieldKeyhole,
                              size: 20,
                              color: TColors.neutralLightLightest,
                            ),
                            SizedBox(width: 8),
                            TextActionL("Bayar"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class _PackageInfoCard {
  PackagePriceModel? package;
  final String logo;
  final Color colorWave;
  final Color bgColor;
  final String name;
  final int period;
  final int pricePerMonth;
  final int totalPrice;

  _PackageInfoCard({
    required this.package,
    required this.logo,
    required this.colorWave,
    required this.bgColor,
    required this.name,
    required this.period,
    required this.pricePerMonth,
    required this.totalPrice,
  });
}

String formatTanggal(DateTime startDate, DateTime endDate) {
  final DateFormat formatter =
      DateFormat('d MMM yyyy', 'id_ID'); // Format: 17 Agu 2024
  return '${formatter.format(startDate)} - ${formatter.format(endDate)}';
}

String getFormattedDateRange(int monthsToAdd) {
  final DateTime today = DateTime.now();
  final DateTime endDate =
      DateTime(today.year, today.month + monthsToAdd, today.day);

  return formatTanggal(today, endDate);
}

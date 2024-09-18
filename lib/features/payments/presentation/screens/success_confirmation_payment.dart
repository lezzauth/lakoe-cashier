import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/responsive/responsive_layout.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_1.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/payment_method_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class SuccessConfirmationPaymentScreen extends StatefulWidget {
  const SuccessConfirmationPaymentScreen({super.key});

  @override
  State<SuccessConfirmationPaymentScreen> createState() =>
      _SuccessConfirmationPaymentScreenState();
}

class _SuccessConfirmationPaymentScreenState
    extends State<SuccessConfirmationPaymentScreen> {
  @override
  void initState() {
    super.initState();

    context.read<CartCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      child: Scaffold(
        body: SafeArea(
            child: ResponsiveLayout(
          mobile: SuccessConfirmationPaymentContent(),
          tablet: Center(
            child: SizedBox(
              width: 311,
              child: SuccessConfirmationPaymentContent(),
            ),
          ),
        )),
      ),
    );
  }
}

class SuccessConfirmationPaymentContent extends StatefulWidget {
  const SuccessConfirmationPaymentContent({super.key});

  @override
  State<SuccessConfirmationPaymentContent> createState() =>
      _SuccessConfirmationPaymentContentState();
}

class _SuccessConfirmationPaymentContentState
    extends State<SuccessConfirmationPaymentContent> {
  String _getPaymentMethodName(String paymentMethod) {
    switch (paymentMethod) {
      case "CASH":
        return TPaymentMethodName.cash;
      case "DEBIT":
        return TPaymentMethodName.debit;
      case "BANK":
        return TPaymentMethodName.bankTransfer;
      case "QR_CODE":
        return TPaymentMethodName.qris;

      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as CompleteOrderResponse;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: const EdgeInsets.only(top: 32, bottom: 28),
                  child: Center(
                    child: Image.asset(
                      TImages.successConfirmation,
                      width: 276,
                      height: 200,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: TextHeading1(
                            TFormatter.formatToRupiah(
                              int.parse(arguments.amount),
                            ),
                          ),
                        ),
                        const TextBodyM(
                          "Yeay! Transaksi berhasil.  🎉",
                          color: Color(0xFF656F77),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: TColors.neutralLightLight,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TextReceipt("No. Order"),
                                TextReceipt(
                                  arguments.no.toString(),
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TextReceipt("Tanggal"),
                                TextReceipt(
                                  TFormatter.orderDate(arguments.createdAt),
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TextReceipt("Pembayaran"),
                                TextReceipt(
                                  _getPaymentMethodName(
                                    arguments.paymentMethod,
                                  ),
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Separator(
                              color: TColors.neutralLightDark,
                              height: 1,
                              dashWidth: 5.0,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TextReceipt("Uang Diterima"),
                                TextReceipt(
                                  TFormatter.formatToRupiah(
                                    int.parse(arguments.paidAmount),
                                  ),
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TextReceipt("Total Tagihan"),
                                TextReceipt(
                                  TFormatter.formatToRupiah(
                                    int.parse(arguments.amount),
                                  ),
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Separator(
                          color: TColors.neutralLightDark,
                          height: 1,
                          dashWidth: 5.0,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        decoration: BoxDecoration(
                          color: TColors.neutralLightLight,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextReceipt("Kembalian"),
                            TextReceipt(
                              TFormatter.formatToRupiah(int.parse(
                                arguments.change,
                              )),
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)))),
                    child: const TextActionL(
                      "Download Struk",
                      color: TColors.primary,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            padding: WidgetStatePropertyAll(
                              EdgeInsets.symmetric(
                                horizontal: 0,
                              ),
                            ),
                          ),
                          child: const TextActionL(
                            "Bagikan Struk",
                            color: TColors.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              padding: WidgetStatePropertyAll(
                                  EdgeInsets.symmetric(horizontal: 16))),
                          child: const TextActionL(
                            "Cetak Struk",
                            color: TColors.primary,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      "/cashier/explore-products",
                      (route) => false,
                    );
                  },
                  child: const TextActionL(
                    "Buat Order Baru",
                    color: TColors.neutralLightLightest,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class TextReceipt extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;

  const TextReceipt(this.data, {super.key, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.kosugi(
        fontSize: TSizes.fontSizeBodyM,
        color: TColors.neutralDarkDarkest,
        fontWeight: fontWeight,
      ),
    );
  }
}

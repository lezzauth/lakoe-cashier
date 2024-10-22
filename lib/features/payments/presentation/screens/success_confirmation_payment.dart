import 'package:app_data_provider/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_repository/order_repository.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/responsive/responsive_layout.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_1.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/bill/application/cubit/bill_master/bill_master_cubit.dart';
import 'package:point_of_sales_cashier/features/bill/data/arguments/template_order_model.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_detail/order_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_detail/order_detail_state.dart';
import 'package:point_of_sales_cashier/features/payments/data/arguments/success_confirmation_payment_argument.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/payment_method_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';
import 'package:point_of_sales_cashier/utils/helpers/receipt_helpers.dart';
import 'package:point_of_sales_cashier/utils/print/bill.dart';
import 'package:shimmer/shimmer.dart';

class SuccessConfirmationPaymentScreen extends StatefulWidget {
  const SuccessConfirmationPaymentScreen({super.key, required this.arguments});

  final SuccessConfirmationPaymentArgument arguments;

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
    return BlocProvider(
      create: (context) => OrderDetailCubit(),
      child: PopScope(
        child: Scaffold(
          body: SafeArea(
            child: ResponsiveLayout(
              mobile: SuccessConfirmationPaymentContent(
                arguments: widget.arguments,
              ),
              tablet: Center(
                child: SizedBox(
                  width: 311,
                  child: SuccessConfirmationPaymentContent(
                    arguments: widget.arguments,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SuccessConfirmationPaymentContent extends StatefulWidget {
  const SuccessConfirmationPaymentContent({super.key, required this.arguments});
  final SuccessConfirmationPaymentArgument arguments;

  @override
  State<SuccessConfirmationPaymentContent> createState() =>
      _SuccessConfirmationPaymentContentState();
}

class _SuccessConfirmationPaymentContentState
    extends State<SuccessConfirmationPaymentContent> {
  final ScrollController _scrollController = ScrollController();
  bool _doPrinting = false;

  void _onInit() {
    context.read<OrderDetailCubit>().findOne(widget.arguments.payment.orderId);
  }

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  void _handlePrintReceipt(
    BuildContext context,
    OrderModel order,
    Function(BuildContext, OwnerProfileModel, OrderModel, String,
            ScrollController)
        action,
  ) {
    final billMasterState = context.read<BillMasterCubit>().state;
    String footNote = billMasterState.footNote;

    final authState = context.read<AuthCubit>().state;

    OwnerProfileModel profile;
    if (authState is AuthReady) {
      profile = authState.profile;
    } else {
      profile = TemplateOrderModel().ownerProfile;
      print('AuthState is not ready, using default profile.');
    }

    action(context, profile, order, footNote, _scrollController);
  }

  @override
  Widget build(BuildContext context) {
    final arguments = widget.arguments;
    final AppDataProvider appDataProvider = AppDataProvider();
    return BlocBuilder<OrderDetailCubit, OrderDetailState>(
        builder: (context, state) => switch (state) {
              OrderDetailLoadSuccess(:final order) => FutureBuilder<bool>(
                  future: appDataProvider.isBillAutoPrint,
                  builder: (context, snapshot) {
                    bool isBillAutoPrint = snapshot.data ?? false;

                    if (isBillAutoPrint && !_doPrinting) {
                      _doPrinting = true;
                      _handlePrintReceipt(
                        context,
                        order,
                        (context, profile, order, footNote, scrollController) {
                          TBill.printReceipt(
                            context,
                            profile,
                            order,
                            footNote,
                          );
                        },
                      );
                    }
                    return PopScope(
                      onPopInvokedWithResult:
                          (popDisposition, popResult) async {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              "/cashier/explore-products",
                              (route) => false,
                            );
                          }
                        });
                        return Future.value(null);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    margin: const EdgeInsets.only(
                                        top: 32, bottom: 28),
                                    child: Center(
                                      child: Image.asset(
                                        TImages.successConfirmation,
                                        width: 276,
                                        height: 200,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32),
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 8),
                                            child: TextHeading1(
                                              TFormatter.formatToRupiah(
                                                double.parse(
                                                    arguments.payment.amount),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 16,
                                          ),
                                          decoration: BoxDecoration(
                                            color: TColors.neutralLightLight,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const TextReceipt(
                                                      "No. Order"),
                                                  TextReceipt(
                                                    "#${arguments.payment.no}",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const TextReceipt("Tanggal"),
                                                  TextReceipt(
                                                    TFormatter.orderDate(
                                                        arguments
                                                            .payment.createdAt),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const TextReceipt(
                                                      "Pembayaran"),
                                                  TextReceipt(
                                                    TPaymentMethodName.getName(
                                                      arguments.payment
                                                          .paymentMethod,
                                                      arguments
                                                          .payment.paidFrom,
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const TextReceipt(
                                                      "Uang Diterima"),
                                                  TextReceipt(
                                                    TFormatter.formatToRupiah(
                                                      double.parse(arguments
                                                          .payment.paidAmount),
                                                    ),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const TextReceipt(
                                                      "Total Tagihan"),
                                                  TextReceipt(
                                                    TFormatter.formatToRupiah(
                                                      double.parse(arguments
                                                          .payment.amount),
                                                    ),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.0),
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
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const TextReceipt("Kembalian"),
                                              TextReceipt(
                                                TFormatter.formatToRupiah(
                                                  double.parse(
                                                    arguments.payment.change,
                                                  ),
                                                ),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  child: BlocBuilder<OrderDetailCubit,
                                      OrderDetailState>(
                                    builder: (context, state) =>
                                        switch (state) {
                                      OrderDetailLoadSuccess(:final order) =>
                                        Row(
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                height: 48,
                                                child: OutlinedButton(
                                                  onPressed: () async {
                                                    _handlePrintReceipt(
                                                      context,
                                                      order,
                                                      (context,
                                                          profile,
                                                          order,
                                                          footNote,
                                                          scrollController) {
                                                        ReceiptHelper
                                                            .showDetailBill(
                                                          context,
                                                          profile: profile,
                                                          order: order,
                                                          footNote: footNote,
                                                          scrollController:
                                                              scrollController,
                                                        );
                                                      },
                                                    );
                                                  },
                                                  style: const ButtonStyle(
                                                    padding:
                                                        WidgetStatePropertyAll(
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
                                                  onPressed: () {
                                                    _handlePrintReceipt(
                                                      context,
                                                      order,
                                                      (context,
                                                          profile,
                                                          order,
                                                          footNote,
                                                          scrollController) {
                                                        TBill.printReceipt(
                                                          context,
                                                          profile,
                                                          order,
                                                          footNote,
                                                        );
                                                      },
                                                    );
                                                  },
                                                  style: const ButtonStyle(
                                                    padding:
                                                        WidgetStatePropertyAll(
                                                      EdgeInsets.symmetric(
                                                          horizontal: 16),
                                                    ),
                                                  ),
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
                                      _ => Row(
                                          children: [
                                            Shimmer.fromColors(
                                              baseColor:
                                                  const Color(0xFFE8E9F1),
                                              highlightColor:
                                                  const Color(0xFFF8F9FE),
                                              child: Container(
                                                height: 48,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  color: TColors
                                                      .neutralLightLightest,
                                                  border: Border.all(
                                                      color: TColors
                                                          .neutralLightMedium,
                                                      width: 1),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Shimmer.fromColors(
                                              baseColor:
                                                  const Color(0xFFE8E9F1),
                                              highlightColor:
                                                  const Color(0xFFF8F9FE),
                                              child: Container(
                                                height: 48,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  color: TColors
                                                      .neutralLightLightest,
                                                  border: Border.all(
                                                      color: TColors
                                                          .neutralLightMedium,
                                                      width: 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                    },
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
                      ),
                    );
                  }),
              _ => const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            });
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

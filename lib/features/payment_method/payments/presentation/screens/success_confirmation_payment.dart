import 'package:app_data_provider/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:customer_repository/customer_repository.dart';
import 'package:logman/logman.dart';
import 'package:order_repository/order_repository.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/ui/separator/separator.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_1.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:lakoe_pos/features/bill/application/cubit/bill_master/bill_master_cubit.dart';
import 'package:lakoe_pos/features/bill/data/arguments/template_order_model.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_detail/order_detail_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_detail/order_detail_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/data/arguments/success_confirmation_payment_argument.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/constants/payment_method_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:lakoe_pos/utils/helpers/receipt_helpers.dart';
import 'package:lakoe_pos/utils/print/bill.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
                  width: 450,
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
  bool _isNavigating = false;
  CustomerModel? customer;

  void _onInit() {
    context.read<OrderDetailCubit>().findOne(widget.arguments.payment.order.id);
    onFirstOrderCompleted();
  }

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  Future<void> onFirstOrderCompleted() async {
    final AppDataProvider appData = AppDataProvider();
    bool hasOrderedBefore = await appData.hasMadeFirstOrder;

    if (!hasOrderedBefore) {
      await appData.setFirstOrderCompleted(true);
      Logman.instance
          .info("✅ First order successful! User is now eligible for review.");
    }
  }

  void _handleReceipt(
    BuildContext context,
    OrderModel order,
    Function(
      BuildContext,
      OwnerProfileModel,
      OrderModel,
      String,
      ScrollController,
    ) action,
  ) async {
    final billMasterState = context.read<BillMasterCubit>().state;
    String footNote = billMasterState.footNote;

    if (!context.mounted) return;

    final authState = context.read<AuthCubit>().state;

    OwnerProfileModel profile;
    if (authState is AuthReady) {
      profile = authState.profile;
    } else {
      profile = TemplateOrderModel().ownerProfile;
      Logman.instance.error('AuthState is not ready, using default profile.');
    }

    action(context, profile, order, footNote, _scrollController);
  }

  void _onShareReceipt(BuildContext context, OrderModel order) async {
    _handleReceipt(
      context,
      order,
      (context, profile, order, footNote, scrollController) {
        ReceiptHelper.showDetailBill(
          context,
          profile: profile,
          order: order,
          customer: customer,
          footNote: footNote,
          scrollController: scrollController,
        );
      },
    );
  }

  void _onPrintReceipt(BuildContext context, OrderModel order) async {
    _handleReceipt(
      context,
      order,
      (context, profile, order, footNote, scrollController) {
        TBill.receiptOrderPrint(
          context,
          profile,
          order,
          footNote,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments = widget.arguments;
    return MultiBlocListener(
      listeners: [
        BlocListener<OrderDetailCubit, OrderDetailState>(
          listener: (context, state) {
            if (state is OrderDetailLoadSuccess) {
              if (state.order.customer == null) return;
              setState(() {
                customer = CustomerModel(
                  id: state.order.customer!.id,
                  name: state.order.customer!.name,
                  phoneNumber: state.order.customer!.phoneNumber,
                  email: state.order.customer!.email,
                  address: state.order.customer!.address,
                );
              });
            }
          },
        ),
      ],
      child: BlocBuilder<OrderDetailCubit, OrderDetailState>(
        builder: (context, state) => switch (state) {
          OrderDetailLoadSuccess(:final order) => FutureBuilder<List<bool>>(
              future: SharedPreferences.getInstance().then((prefs) => [
                    prefs.getBool('print_order_ticket') ?? false,
                    prefs.getBool('auto_print_receipt') ?? false,
                  ]),
              builder: (context, snapshot) {
                if (!_doPrinting && (snapshot.data?[1] ?? false)) {
                  _doPrinting = true;

                  Future.delayed(
                    (snapshot.data?[0] ?? false)
                        ? Duration(seconds: 5)
                        : Duration.zero,
                    () {
                      if (!context.mounted) return;
                      _handleReceipt(
                        context,
                        order,
                        (context, profile, order, footNote, scrollController) {
                          TBill.receiptOrderPrint(
                              context, profile, order, footNote);
                        },
                      );
                    },
                  );
                }
                return PopScope(
                  canPop: widget.arguments.isCashier,
                  onPopInvokedWithResult: (popDisposition, popResult) async {
                    if (!_isNavigating) {
                      _isNavigating = true;

                      if (widget.arguments.isCashier) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) {
                            context.read<CartCubit>().reset();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              "/cashier",
                              (route) => false,
                            );
                          }
                        });
                        return Future.value(null);
                      } else {
                        if (mounted) {
                          Navigator.pop(context, true);
                        }
                      }
                    }
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                margin:
                                    const EdgeInsets.only(top: 32, bottom: 28),
                                child: Center(
                                  child: Image.asset(
                                    TImages.successConfirmation,
                                    width: 276,
                                    height: 200,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 32),
                                margin: EdgeInsets.only(bottom: 20),
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 8),
                                        child: TextHeading1(
                                          TFormatter.formatToRupiah(
                                            double.parse(arguments
                                                .payment.transaction.amount),
                                          ),
                                        ),
                                      ),
                                      TextBodyM(
                                        "Yeay! Transaksi berhasil.  🎉",
                                        color: Color(0xFF656F77),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 32),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextReceipt("No. Order"),
                                              TextReceipt(
                                                "#${arguments.payment.order.no}",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextReceipt("Tanggal"),
                                              TextReceipt(
                                                TFormatter.dateTime(arguments
                                                    .payment
                                                    .transaction
                                                    .createdAt),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextReceipt("Pembayaran"),
                                              TextReceipt(
                                                TPaymentMethodName.getName(
                                                  arguments.payment.transaction
                                                      .paymentMethod,
                                                  arguments.payment.transaction
                                                      .paidFrom,
                                                ),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          if (arguments.payment.transaction
                                                  .approvalCode !=
                                              null)
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  TextReceipt("Approval Code"),
                                                  TextReceipt(
                                                    arguments
                                                        .payment
                                                        .transaction
                                                        .approvalCode!,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          Separator(
                                            color: TColors.neutralLightDark,
                                            height: 1,
                                            dashWidth: 5.0,
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextReceipt("Uang Diterima"),
                                              TextReceipt(
                                                TFormatter.formatToRupiah(
                                                  double.parse(arguments.payment
                                                      .transaction.paidAmount),
                                                ),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextReceipt("Total Tagihan"),
                                              TextReceipt(
                                                TFormatter.formatToRupiah(
                                                  double.parse(arguments.payment
                                                      .transaction.amount),
                                                ),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                      ),
                                      child: Separator(
                                        color: TColors.neutralLightDark,
                                        height: 1,
                                        dashWidth: 5.0,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        color: TColors.neutralLightLight,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextReceipt(
                                            "Kembalian",
                                            fontWeight: FontWeight.bold,
                                            fontSize: TSizes.fontSizeHeading2,
                                          ),
                                          TextReceipt(
                                            TFormatter.formatToRupiah(
                                              double.parse(
                                                arguments
                                                    .payment.transaction.change,
                                              ),
                                            ),
                                            fontWeight: FontWeight.bold,
                                            fontSize: TSizes.fontSizeHeading1,
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: BlocBuilder<OrderDetailCubit,
                                  OrderDetailState>(
                                builder: (context, state) => switch (state) {
                                  OrderDetailLoadSuccess(:final order) => Row(
                                      children: [
                                        Expanded(
                                          child: OutlinedButton(
                                            onPressed: () =>
                                                _onShareReceipt(context, order),
                                            child: TextActionL("Bagikan Struk"),
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Expanded(
                                          child: OutlinedButton(
                                            onPressed: () =>
                                                _onPrintReceipt(context, order),
                                            child: TextActionL("Print Struk"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  _ => Row(
                                      children: [
                                        Shimmer.fromColors(
                                          baseColor: Color(0xFFE8E9F1),
                                          highlightColor: Color(0xFFF8F9FE),
                                          child: Container(
                                            height: 48,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              color:
                                                  TColors.neutralLightLightest,
                                              border: Border.all(
                                                  color: TColors
                                                      .neutralLightMedium,
                                                  width: 1),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Shimmer.fromColors(
                                          baseColor: Color(0xFFE8E9F1),
                                          highlightColor: Color(0xFFF8F9FE),
                                          child: Container(
                                            height: 48,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              color:
                                                  TColors.neutralLightLightest,
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
                            Visibility(
                              visible: widget.arguments.isCashier,
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      "/cashier",
                                      (route) => false,
                                    );
                                  },
                                  child: TextActionL("Buat Pesanan Baru"),
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
        },
      ),
    );
  }
}

class TextReceipt extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final double? fontSize;

  const TextReceipt(
    this.data, {
    super.key,
    this.fontWeight,
    this.fontSize = TSizes.fontSizeBodyM,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.kosugi(
        fontSize: fontSize,
        color: TColors.neutralDarkDarkest,
        fontWeight: fontWeight,
      ),
    );
  }
}

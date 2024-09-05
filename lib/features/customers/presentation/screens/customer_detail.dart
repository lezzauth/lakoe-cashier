import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_detail/customer_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_detail/customer_detail_state.dart';
import 'package:point_of_sales_cashier/features/orders/data/arguments/order_detail_argument.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class CustomerDetailScreen extends StatelessWidget {
  const CustomerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) => switch (state) {
        AuthReady() => const CustomerDetail(),
        _ => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      },
    );
  }
}

class CustomerDetail extends StatefulWidget {
  const CustomerDetail({super.key});

  @override
  State<CustomerDetail> createState() => _CustomerDetailState();
}

class _CustomerDetailState extends State<CustomerDetail> {
  Future<void> _onRefresh() async {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        final arguments =
            ModalRoute.of(context)!.settings.arguments as CustomerModel;
        AuthReady authState = context.read<AuthCubit>().state as AuthReady;

        await context.read<CustomerDetailCubit>().findOne(
              outletId: authState.outletId,
              customerId: arguments.id,
            );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Detail Pelanggan",
      ),
      body: BlocBuilder<CustomerDetailCubit, CustomerDetailState>(
          builder: (context, state) => switch (state) {
                CustomerDetailLoadSuccess(:final customer) => Scrollbar(
                    child: RefreshIndicator(
                      onRefresh: _onRefresh,
                      backgroundColor: TColors.neutralLightLightest,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        TImages.contactAvatar,
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(width: 16),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextHeading4(customer.customer.name),
                                          TextBodyS(
                                            customer.customer.phoneNumber,
                                            color: TColors.neutralDarkLight,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const UiIcons(
                                          TIcons.coinMultiple,
                                          height: 16,
                                          width: 16,
                                          color: TColors.primary,
                                        ),
                                        const SizedBox(width: 4),
                                        TextHeading4(
                                          customer.customer.owners.first.coin
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                    const TextBodyS(
                                      "Poin",
                                      color: TColors.neutralDarkLight,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 4,
                            color: TColors.neutralLightMedium,
                            margin:
                                const EdgeInsets.only(top: 8.0, bottom: 16.0),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 6.0, left: 16, right: 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const TextHeading3("Riwayat Transaksi"),
                                      TextBodyS(
                                        "Total ${customer.customer.count.orders} transaksi",
                                        color: TColors.neutralDarkLight,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CustomerSummaryCard(
                                          title: "Total Belanja",
                                          value: TFormatter.formatToRupiah(
                                            int.parse(
                                              customer.summary.totalPrice,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: CustomerSummaryCard(
                                          title: "Menu Favorit",
                                          value: customer.summary.favorite,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: SizedBox(
                                      width: double.maxFinite,
                                      child: Row(
                                        children: [
                                          Wrap(
                                            direction: Axis.horizontal,
                                            alignment: WrapAlignment.start,
                                            spacing: 8,
                                            children: [
                                              InputChip(
                                                onPressed: () {},
                                                label: const Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    TextBodyS("Urutkan"),
                                                    SizedBox(width: 8),
                                                    UiIcons(
                                                      TIcons.arrowDown,
                                                      height: 12,
                                                      width: 12,
                                                      color: TColors
                                                          .neutralDarkLightest,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              InputChip(
                                                onPressed: () {},
                                                label: const Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    TextBodyS("Semua Tanggal"),
                                                    SizedBox(width: 8),
                                                    UiIcons(
                                                      TIcons.arrowDown,
                                                      height: 12,
                                                      width: 12,
                                                      color: TColors
                                                          .neutralDarkLightest,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: customer.customer.orders.length,
                              itemBuilder: (context, index) {
                                DetailCustomerOrder order =
                                    customer.customer.orders.elementAt(index);

                                bool isPaid = order.paymentStatus == "PAID";
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/orders/detail",
                                        arguments:
                                            OrderDetailArgument(id: order.id));
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 1,
                                          color: TColors.neutralLightMedium,
                                        ),
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                    ),
                                    child: Stack(
                                      children: [
                                        if (isPaid)
                                          Positioned(
                                            right: 47,
                                            bottom: 0,
                                            child: Image.asset(
                                              TImages.stamp,
                                              width: 80,
                                              height: 53.35,
                                            ),
                                          ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 14,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: isPaid
                                                ? CrossAxisAlignment.center
                                                : CrossAxisAlignment.end,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 8.0),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: TSizes
                                                              .fontSizeHeading4,
                                                          color: TColors
                                                              .neutralDarkDarkest,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        text:
                                                            "Order #${order.no}",
                                                        children: [
                                                          TextSpan(
                                                            style: GoogleFonts
                                                                .inter(
                                                              fontSize: TSizes
                                                                  .fontSizeBodyS,
                                                              color: TColors
                                                                  .neutralDarkLight,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            text:
                                                                " - (${order.count.items} Item)",
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  TextBodyS(
                                                    TFormatter.orderDate(
                                                      order.createdAt,
                                                    ),
                                                    color: TColors
                                                        .neutralDarkLight,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  if (order.transactions
                                                          .firstOrNull !=
                                                      null)
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 5),
                                                      child: TransactionTypeTag(
                                                        tag: order
                                                            .transactions
                                                            .first
                                                            .paymentMethod,
                                                      ),
                                                    ),
                                                  RichText(
                                                    text: TextSpan(
                                                        text: "Total: ",
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: TSizes
                                                              .fontSizeBodyS,
                                                          color: TColors
                                                              .neutralDarkLight,
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                            text: TFormatter
                                                                .formatToRupiah(
                                                              int.parse(
                                                                order.price,
                                                              ),
                                                            ),
                                                            style: GoogleFonts
                                                                .inter(
                                                              fontSize: TSizes
                                                                  .fontSizeBodyM,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              color: TColors
                                                                  .neutralDarkDarkest,
                                                            ),
                                                          )
                                                        ]),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                CustomerDetailLoadFailure(:final error) => Center(
                    child: TextBodyS(
                      error,
                      color: TColors.error,
                    ),
                  ),
                _ => const Center(
                    child: CircularProgressIndicator(),
                  ),
              }),
    );
  }
}

class TransactionTypeTag extends StatelessWidget {
  const TransactionTypeTag({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context) {
    String getTagLabel() {
      switch (tag) {
        case "CASH":
          return "Cash";
        case "QRIS":
          return "QRIS";
        case "DEBIT":
          return "Debit";
        default:
          return "Cash";
      }
    }

    Color getTagBackgroundColor() {
      switch (tag) {
        case "CASH":
          return TColors.successLight;
        case "QRIS":
          return TColors.infoLight;
        case "DEBIT":
          return TColors.warningLight;
        default:
          return TColors.successLight;
      }
    }

    Color getTagTextColor() {
      switch (tag) {
        case "CASH":
          return TColors.successMedium;
        case "QRIS":
          return TColors.infoMedium;
        case "DEBIT":
          return TColors.warningDark;
        default:
          return TColors.successMedium;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: getTagBackgroundColor(),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextHeading5(
        getTagLabel(),
        color: getTagTextColor(),
      ),
    );
  }
}

class CustomerSummaryCard extends StatelessWidget {
  const CustomerSummaryCard({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: TColors.neutralLightLight,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          width: 1,
          color: TColors.neutralLightMedium,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: TextHeading5(
              title,
              color: TColors.neutralDarkLightest,
            ),
          ),
          TextHeading3(
            value,
            color: TColors.neutralDarkDarkest,
          ),
        ],
      ),
    );
  }
}

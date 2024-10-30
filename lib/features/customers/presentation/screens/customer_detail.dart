import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_detail/customer_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_detail/customer_detail_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_detail/customer_detail_filter_state.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_detail/customer_detail_state.dart';
import 'package:point_of_sales_cashier/features/customers/presentation/widgets/order_item.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/filters/order_date_filter.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class CustomerDetailScreen extends StatelessWidget {
  const CustomerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerDetailFilterCubit(),
      child: const CustomerDetail(),
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
        CustomerDetailFilterState filterState =
            context.read<CustomerDetailFilterCubit>().state;

        await context.read<CustomerDetailCubit>().findOne(
              customerId: arguments.id,
              dto: DetailCustomerOutletDto(
                from: filterState.from,
                template: ["ALL", "CUSTOM"].contains(filterState.template)
                    ? null
                    : filterState.template,
                to: filterState.to,
              ),
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
    return BlocListener<CustomerDetailFilterCubit, CustomerDetailFilterState>(
      listener: (context, state) {
        final arguments =
            ModalRoute.of(context)!.settings.arguments as CustomerModel;

        context.read<CustomerDetailCubit>().findOne(
              customerId: arguments.id,
              dto: DetailCustomerOutletDto(
                from: state.from,
                template: ["ALL", "CUSTOM"].contains(state.template)
                    ? null
                    : state.template,
                to: state.to,
              ),
            );
      },
      child: Scaffold(
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
                                      SizedBox(height: 4),
                                      TextBodyS(
                                        customer.customer.phoneNumber,
                                        color: TColors.neutralDarkLight,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // Column(
                            //   mainAxisSize: MainAxisSize.min,
                            //   crossAxisAlignment: CrossAxisAlignment.end,
                            //   children: [
                            //     Row(
                            //       mainAxisAlignment: MainAxisAlignment.end,
                            //       children: [
                            //         SvgPicture.asset(
                            //           TImages.lakoeCoin,
                            //           height: 20,
                            //           width: 20,
                            //         ),
                            //         const SizedBox(width: 4),
                            //         TextHeading4(
                            //           customer.customer.owners.first.coin
                            //               .toString(),
                            //         ),
                            //       ],
                            //     ),
                            //     const TextBodyS(
                            //       "Poin",
                            //       color: TColors.neutralDarkLight,
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: 4,
                        color: TColors.neutralLightMedium,
                        margin: const EdgeInsets.only(top: 8.0, bottom: 16.0),
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
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomerSummaryCard(
                                      title: "Total Belanja",
                                      value: TFormatter.formatToRupiah(
                                        double.parse(
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
                              padding: const EdgeInsets.symmetric(vertical: 8),
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
                                          BlocBuilder<CustomerDetailFilterCubit,
                                                  CustomerDetailFilterState>(
                                              builder: (context, state) {
                                            return OrderDateFilter(
                                              from: state.from,
                                              template: state.template,
                                              to: state.to,
                                              onChanged: (template, from, to) {
                                                context
                                                    .read<
                                                        CustomerDetailFilterCubit>()
                                                    .setFilter(
                                                      template: template,
                                                      from: from,
                                                      to: to,
                                                    );
                                              },
                                            );
                                          }),
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
                      if (customer.customer.orders.isEmpty)
                        EmptyList(
                          image: SvgPicture.asset(
                            TImages.catBox,
                            width: 140,
                            height: 101.45,
                          ),
                          title: "Belum ada transaksi, nih!",
                          subTitle:
                              "${customer.customer.name} sampai saat ini belum pernah melakukan transaksi.",
                        ),
                      if (customer.customer.orders.isNotEmpty)
                        Expanded(
                          child: ListView.builder(
                            itemCount: customer.customer.orders.length,
                            itemBuilder: (context, index) {
                              DetailCustomerOrder order = customer
                                  .customer.orders.reversed
                                  .elementAt(index);

                              return OrderItem(order: order);
                            },
                          ),
                        )
                    ],
                  ),
                ),
              ),
            CustomerDetailLoadFailure() => Center(
                child: CircularProgressIndicator(),
              ),
            _ => const Center(
                child: CircularProgressIndicator(),
              ),
          },
        ),
      ),
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
        case "QR_CODE":
          return "QRIS";
        case "DEBIT":
          return "Debit";
        case "BANK_TRANSFER":
          return "Bank Transfer";
        default:
          return "Cash";
      }
    }

    Color getTagBackgroundColor() {
      switch (tag) {
        case "CASH":
          return TColors.successLight;
        case "QR_CODE":
          return TColors.infoLight;
        case "DEBIT":
          return TColors.warningLight;
        case "BANK_TRANSFER":
          return TColors.neutralLightMedium;
        default:
          return TColors.successLight;
      }
    }

    Color getTagTextColor() {
      switch (tag) {
        case "CASH":
          return TColors.successMedium;
        case "QR_CODE":
          return TColors.infoMedium;
        case "DEBIT":
          return TColors.warningDark;
        case "BANK_TRANSFER":
          return TColors.neutralDarkDark;
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

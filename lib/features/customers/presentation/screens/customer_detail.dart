import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/features/customers/presentation/widgets/filter_orders.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_detail/customer_detail_cubit.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_detail/customer_detail_filter_cubit.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_detail/customer_detail_filter_state.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_detail/customer_detail_state.dart';
import 'package:lakoe_pos/features/customers/presentation/widgets/order_item.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

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
  bool isFilterActive = false;

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

  void _handleFilterChange(DetailCustomerOutletDto value) {
    final isAllNull = (value.template == null || value.template == "ALL") &&
        value.from == null &&
        value.to == null &&
        (value.status == null || value.status == "ALL");

    setState(() {
      isFilterActive = !isAllNull;
    });

    final from = value.template == "CUSTOM"
        ? DateTime.parse(value.from!)
        : value.from != null
            ? DateTime.parse(value.from!)
            : null;

    final to = value.template == "CUSTOM"
        ? DateTime.parse(value.to!)
        : value.to != null
            ? DateTime.parse(value.to!)
            : null;

    context.read<CustomerDetailFilterCubit>().setFilter(
          status: value.status,
          template: value.template,
          from: from,
          to: to,
        );
  }

  void _handleClearFilter() {
    setState(() {
      isFilterActive = false;
    });
    context.read<CustomerDetailFilterCubit>().clearFilter();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerDetailFilterCubit, CustomerDetailFilterState>(
      listener: (context, state) {
        final arguments =
            ModalRoute.of(context)!.settings.arguments as CustomerModel;

        CustomerDetailFilterState filterState =
            context.read<CustomerDetailFilterCubit>().state;

        context.read<CustomerDetailCubit>().findOne(
              customerId: arguments.id,
              dto: filterState.toDetailCustomerOutletDto,
            );
      },
      child: Scaffold(
        appBar: const CustomAppbar(
          title: "Detail Pelanggan",
        ),
        body: BlocListener<CustomerDetailCubit, CustomerDetailState>(
          listener: (context, state) {},
          child: BlocBuilder<CustomerDetailCubit, CustomerDetailState>(
            builder: (context, state) {
              if (state is CustomerDetailLoadSuccess) {
                final data = state.data;
                return Scrollbar(
                  child: RefreshIndicator(
                    onRefresh: _onRefresh,
                    backgroundColor: TColors.neutralLightLightest,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
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
                                    SizedBox(width: 16),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextHeading4(data.customer.name),
                                        SizedBox(height: 4),
                                        TextBodyS(
                                          PhoneNumberFormatter.formatForDisplay(
                                            data.customer.phoneNumber,
                                          ),
                                          color: TColors.neutralDarkLight,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  CustomerModel? newCustomer =
                                      await Navigator.pushNamed(
                                    context,
                                    "/customers/edit",
                                    arguments: CustomerModel(
                                      id: data.customer.id,
                                      name: data.customer.name,
                                      phoneNumber: data.customer.phoneNumber,
                                      email: data.customer.email,
                                      address: data.customer.address,
                                    ),
                                  ) as CustomerModel?;
                                  if (newCustomer == null) return;

                                  if (!context.mounted) return;
                                  _onRefresh();
                                },
                                child: TextActionL(
                                  "Ubah",
                                  color: TColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 4,
                          color: TColors.neutralLightMedium,
                          margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 6.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const TextHeading3(
                                              "Riwayat Transaksi"),
                                          TextBodyS(
                                            "Total ${data.customer.count.orders} transaksi",
                                            color: TColors.neutralDarkLight,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: CustomerSummaryCard(
                                              title: "Total Belanja",
                                              value: TFormatter.formatToRupiah(
                                                double.parse(
                                                    data.summary.totalPrice),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: CustomerSummaryCard(
                                              title: "Menu Favorit",
                                              value: data.summary.favorite,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              BlocBuilder<CustomerDetailFilterCubit,
                                  CustomerDetailFilterState>(
                                builder: (context, state) {
                                  return FilterOrdersByCustomer(
                                    value: state.toDetailCustomerOutletDto,
                                    onClear: () {
                                      _handleClearFilter();
                                    },
                                    onChanged: (value) {
                                      _handleFilterChange(value);
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        if (data.customer.orders.isEmpty)
                          EmptyList(
                              image: SvgPicture.asset(
                                TImages.catBox,
                                width: 140,
                                height: 101.45,
                              ),
                              title: (!isFilterActive)
                                  ? "Belum ada transaksi, nih!"
                                  : "Pembelian tidak titemuakn",
                              subTitle: (!isFilterActive)
                                  ? "${data.customer.name} sampai saat ini belum pernah melakukan transaksi."
                                  : "Ubah tanggal atau ganti filter status untuk melihat pembelian dari ${data.customer.name}",
                              action: (!isFilterActive)
                                  ? SizedBox.shrink()
                                  : TextButton(
                                      onPressed: _handleClearFilter,
                                      child: TextActionL(
                                        "Hapus Filter",
                                        color: TColors.primary,
                                      ),
                                    )),
                        if (data.customer.orders.isNotEmpty)
                          Expanded(
                            child: ListView.builder(
                              itemCount: data.customer.orders.length,
                              itemBuilder: (context, index) {
                                DetailCustomerOrder order = data
                                    .customer.orders.reversed
                                    .elementAt(index);
                                return OrderItem(order: order);
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              } else if (state is CustomerDetailLoadFailure) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class TagPaymentMethod extends StatelessWidget {
  const TagPaymentMethod({super.key, required this.tag});

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
        case "UNPAID":
          return "Belum Dibayar";
        case "CANCEL":
          return "-";
        default:
          return "-";
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
        case "UNPAID":
          return TColors.neutralLightMedium;
        case "CANCEL":
          return TColors.neutralLightMedium;
        default:
          return TColors.successLight;
      }
    }

    Color getTagTextColor() {
      switch (tag) {
        case "CASH":
          return TColors.success;
        case "QR_CODE":
          return TColors.info;
        case "DEBIT":
          return TColors.warningDark;
        case "BANK_TRANSFER":
          return TColors.neutralDarkDark;
        case "UNPAID":
          return TColors.neutralDarkDark;
        case "CANCEL":
          return TColors.neutralDarkDark;
        default:
          return TColors.success;
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

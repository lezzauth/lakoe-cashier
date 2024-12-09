import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/form/search_field.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/shimmer/list_shimmer.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/cart/application/cubit/customer/cart_customer_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/customer/cart_customer_filter_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/customer/cart_customer_filter_state.dart';
import 'package:lakoe_pos/features/cart/application/cubit/customer/cart_customer_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class CartCustomerList extends StatelessWidget {
  const CartCustomerList({super.key, this.value});

  final CustomerModel? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCustomerFilterCubit(),
      child: CartCustomerListContent(value: value),
    );
  }
}

class CartCustomerListContent extends StatefulWidget {
  final CustomerModel? value;

  const CartCustomerListContent({super.key, this.value});

  @override
  State<CartCustomerListContent> createState() =>
      _CartCustomerListContentState();
}

class _CartCustomerListContentState extends State<CartCustomerListContent> {
  final TextEditingController _searchController = TextEditingController();

  Future<void> _onInit() async {
    await context.read<CartCustomerCubit>().init();
  }

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  Future<void> onRefresh() async {
    CartCustomerFilterState filterState =
        context.read<CartCustomerFilterCubit>().state;

    context
        .read<CartCustomerCubit>()
        .findAll(FindAllCustomerDto(search: filterState.search));
  }

  Future<void> clearSearch() async {
    context.read<CartCustomerFilterCubit>().clearFilter();
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCustomerFilterCubit, CartCustomerFilterState>(
      listener: (context, state) {
        context
            .read<CartCustomerCubit>()
            .findAll(FindAllCustomerDto(search: state.search));
      },
      child: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: SearchField(
                  hintText: "Cari pelanggan...",
                  controller: _searchController,
                  debounceTime: 500,
                  onChanged: (value) {
                    context
                        .read<CartCustomerFilterCubit>()
                        .setFilter(search: value);
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<CartCustomerCubit, CartCustomerState>(
                  builder: (context, state) {
                    if (state is CartCustomerLoadSuccess) {
                      final customers = state.customers;

                      if (customers.isEmpty) {
                        return EmptyList(
                          title: "Pencarian tidak ditemukan",
                          subTitle: "Coba cari dengan nama pelanggan yang lain",
                          action: TextButton(
                            onPressed: clearSearch,
                            child: TextActionL(
                              "Hapus Pencarian",
                              color: TColors.primary,
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        itemCount: customers.length,
                        itemBuilder: (context, index) {
                          CustomerModel customer = customers.elementAt(index);
                          bool selected =
                              customer.id == (widget.value?.id ?? "-");

                          return Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1,
                                  color: TColors.neutralLightMedium,
                                ),
                              ),
                            ),
                            child: ListTile(
                              leading: SvgPicture.asset(
                                TImages.contactAvatar,
                                height: 40,
                                width: 40,
                              ),
                              title: TextHeading4(customer.name),
                              subtitle: TextBodyS(
                                (customer.phoneNumber == '-')
                                    ? customer.phoneNumber
                                    : PhoneNumberFormatter.formatForDisplay(
                                        customer.phoneNumber,
                                      ),
                                color: TColors.neutralDarkLight,
                              ),
                              onTap: () {
                                Navigator.pop(
                                  context,
                                  customer.id == "-"
                                      ? CustomerModel(
                                          id: "-",
                                          name: "Tamu",
                                          email: "",
                                          phoneNumber: "-",
                                          address: "",
                                        )
                                      : customer,
                                );
                              },
                              trailing: selected
                                  ? const UiIcons(
                                      TIcons.check,
                                      color: TColors.primary,
                                    )
                                  : const UiIcons(
                                      TIcons.arrowRight,
                                      size: 12,
                                      color: TColors.neutralDarkLightest,
                                    ),
                            ),
                          );
                        },
                      );
                    } else if (state is CartCustomerLoadFailure) {
                      return EmptyList(
                        title: "Gagal memuat data, nih!",
                        subTitle: "Ada sedikit gangguan. Coba coba lagi, ya",
                        action: TextButton(
                          onPressed: onRefresh,
                          child: TextActionL(
                            "Coba Lagi",
                            color: TColors.primary,
                          ),
                        ),
                      );
                    } else {
                      return ListShimmer(
                        crossAlignment: "center",
                        circleAvatar: true,
                        sizeAvatar: 40.0,
                        heightTitle: 16.0,
                        heightSubtitle: 12.0,
                      );
                    }
                  },
                ),
              )
            ],
          ),
          floatingActionButton: SizedBox(
            height: 48,
            width: 48,
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              onPressed: () async {
                CustomerModel? newCustomer =
                    await Navigator.pushNamed(context, "/customers/new")
                        as CustomerModel?;
                if (newCustomer == null) return;

                if (!context.mounted) return;
                Navigator.pop(context, newCustomer);
                _onInit();
              },
              elevation: 0,
              child: const Icon(
                Icons.add,
                size: 24,
              ),
            ),
          )),
    );
  }
}

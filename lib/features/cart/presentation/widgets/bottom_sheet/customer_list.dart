import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/customer/cart_customer_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/customer/cart_customer_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/customer/cart_customer_filter_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/customer/cart_customer_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

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
                    builder: (context, state) => switch (state) {
                          CartCustomerLoadSuccess(:final customers) =>
                            ListView.builder(
                              itemCount: customers.length,
                              itemBuilder: (context, index) {
                                CustomerModel customer =
                                    customers.elementAt(index);
                                bool selected =
                                    customer.id == (widget.value?.id ?? "-");

                                return Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                    width: 1,
                                    color: TColors.neutralLightMedium,
                                  ))),
                                  child: ListTile(
                                    leading: SvgPicture.asset(
                                      TImages.contactAvatar,
                                      height: 40,
                                      width: 40,
                                    ),
                                    title: TextHeading4(customer.name),
                                    subtitle: TextBodyS(
                                      PhoneNumberFormatter.formatForDisplay(
                                          customer.phoneNumber),
                                      color: TColors.neutralDarkLight,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context,
                                          customer.id == "-" ? null : customer);
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
                            ),
                          CartCustomerLoadFailure() => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          _ => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        }),
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

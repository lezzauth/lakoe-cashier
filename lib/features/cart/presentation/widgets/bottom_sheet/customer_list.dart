import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/customer/cart_customer_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/customer/cart_customer_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/customer/cart_customer_filter_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/customer/cart_customer_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class CartCustomerList extends StatelessWidget {
  const CartCustomerList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCustomerFilterCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) => switch (state) {
          AuthReady() => const CartCustomerListContent(),
          _ => const Center(
              child: CircularProgressIndicator(),
            ),
        },
      ),
    );
  }
}

class CartCustomerListContent extends StatefulWidget {
  const CartCustomerListContent({super.key});

  @override
  State<CartCustomerListContent> createState() =>
      _CartCustomerListContentState();
}

class _CartCustomerListContentState extends State<CartCustomerListContent> {
  Future<void> _onInit() async {
    AuthReady authState = context.read<AuthCubit>().state as AuthReady;
    await context.read<CartCustomerCubit>().init(authState.profile.id);
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
        AuthReady authState = context.read<AuthCubit>().state as AuthReady;
        context.read<CartCustomerCubit>().findAll(FindAllCustomerDto(
              ownerId: authState.profile.id,
              search: state.search,
            ));
      },
      child: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SearchField(
                  hintText: "Cari pelanggan...",
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

                                return ListTile(
                                  leading: SvgPicture.asset(
                                    TImages.contactAvatar,
                                    height: 40,
                                    width: 40,
                                  ),
                                  title: TextHeading4(customer.name),
                                  subtitle: TextBodyS(
                                    customer.phoneNumber,
                                    color: TColors.neutralDarkLight,
                                  ),
                                  onTap: () {
                                    Navigator.pop(context,
                                        customer.id == "-" ? null : customer);
                                  },
                                );
                              },
                            ),
                          CartCustomerLoadFailure(:final error) => Center(
                              child: TextBodyS(
                                error,
                                color: TColors.error,
                              ),
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
                bool? newCustomer =
                    await Navigator.pushNamed(context, "/customers/new")
                        as bool?;
                if (newCustomer != true) return;
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

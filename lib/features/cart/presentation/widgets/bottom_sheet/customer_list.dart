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
import 'package:point_of_sales_cashier/features/cart/application/cubit/customer/cart_customer_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class CartCustomerList extends StatelessWidget {
  const CartCustomerList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) => switch (state) {
        AuthReady() => const CartCustomerListContent(),
        _ => const Center(
            child: CircularProgressIndicator(),
          ),
      },
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
  @override
  void initState() {
    super.initState();

    AuthReady authState = context.read<AuthCubit>().state as AuthReady;
    context.read<CartCustomerCubit>().init(authState.profile.id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SearchField(
            hintText: "Cari pelanggan...",
            debounceTime: 500,
            onChanged: (value) {},
          ),
        ),
        Expanded(
          child: BlocBuilder<CartCustomerCubit, CartCustomerState>(
              builder: (context, state) => switch (state) {
                    CartCustomerLoadSuccess(:final customers) =>
                      ListView.builder(
                        itemCount: customers.length,
                        itemBuilder: (context, index) {
                          CustomerModel customer = customers.elementAt(index);

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
    );
  }
}

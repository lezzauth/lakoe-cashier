import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_cubit.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  Future<void> _onFetchCustomers() async {
    AuthState authState = context.read<AuthCubit>().state;
    if (authState is! AuthReady) return;

    return await context.read<CustomerCubit>().findAll(
          FindAllCustomerDto(ownerId: authState.profile.id),
        );
  }

  @override
  void initState() {
    super.initState();
    _onFetchCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCubit, CustomerState>(
        builder: (context, state) => switch (state) {
              CustomerLoadSuccess(:final customers) => ListView.builder(
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
                        Navigator.pop(
                            context, customer.id == "-" ? null : customer);
                      },
                    );
                  },
                ),
              CustomerLoadFailure(:final error) => Center(
                  child: TextBodyS(
                    error,
                    color: TColors.error,
                  ),
                ),
              _ => Center(
                  child: CircularProgressIndicator(),
                ),
            });
  }
}

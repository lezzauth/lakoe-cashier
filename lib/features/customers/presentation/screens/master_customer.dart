import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_master/customer_master_cubit.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_master/customer_master_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_master/customer_master_filter_state.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_master/customer_master_state.dart';
import 'package:point_of_sales_cashier/features/customers/common/widgets/customer_contact/customer_contact_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class MasterCustomerScreen extends StatefulWidget {
  const MasterCustomerScreen({super.key});

  @override
  State<MasterCustomerScreen> createState() => _MasterCustomerScreenState();
}

class _MasterCustomerScreenState extends State<MasterCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) => switch (state) {
        AuthReady() => const MasterCustomer(),
        _ => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      },
    );
  }
}

class MasterCustomer extends StatefulWidget {
  const MasterCustomer({super.key});

  @override
  State<MasterCustomer> createState() => _MasterCustomerState();
}

class _MasterCustomerState extends State<MasterCustomer> {
  Future<void> _onRefresh() async {
    AuthReady authState = context.read<AuthCubit>().state as AuthReady;

    context
        .read<CustomerMasterCubit>()
        .findAll(FindAllCustomerDto(ownerId: authState.profile.id));
  }

  @override
  void initState() {
    super.initState();

    AuthReady authState = context.read<AuthCubit>().state as AuthReady;
    context.read<CustomerMasterCubit>().init(authState.profile.id);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CustomerMasterFilterCubit, CustomerMasterFilterState>(
          listener: (context, state) {
            //
          },
        ),
        BlocListener<CustomerMasterCubit, CustomerMasterState>(
          listener: (context, state) {
            if (state is CustomerMasterActionSuccess) {
              _onRefresh();
            }
          },
        )
      ],
      child: Scaffold(
        appBar: const CustomAppbar(
          search: SearchField(
            hintText: "Cari pelanggan...",
          ),
        ),
        body: Scrollbar(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            backgroundColor: TColors.neutralLightLightest,
            child: BlocBuilder<CustomerMasterCubit, CustomerMasterState>(
                builder: (context, state) => switch (state) {
                      CustomerMasterLoadSuccess(:final customers) =>
                        customers.isNotEmpty
                            ? ListView.builder(
                                itemCount: customers.length,
                                itemBuilder: (context, index) {
                                  CustomerModel customer =
                                      customers.elementAt(index);

                                  return CustomerContactItem(
                                    name: customer.name,
                                    phoneNumber: customer.phoneNumber,
                                    onTap: () {
                                      if (customer.id == "-") return;

                                      Navigator.pushNamed(
                                        context,
                                        "/customers/detail",
                                        arguments: customer,
                                      );
                                    },
                                  );
                                },
                              )
                            : const EmptyList(
                                title: "Belum ada pelanggan, nih!",
                                subTitle: "Yuk! Daftarkan pelanggan kamu.",
                              ),
                      CustomerMasterLoadFailure(:final error) => Center(
                          child: TextBodyS(
                            error,
                            color: TColors.error,
                          ),
                        ),
                      _ => const Center(
                          child: CircularProgressIndicator(),
                        ),
                    }),
          ),
        ),
        floatingActionButton: SizedBox(
          height: 48,
          width: 48,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/customers/new");
            },
            elevation: 0,
            child: const Icon(
              Icons.add,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}

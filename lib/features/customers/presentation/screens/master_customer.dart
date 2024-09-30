import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
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
    return BlocProvider(
      create: (context) => CustomerMasterFilterCubit(),
      child: const MasterCustomer(),
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
    context.read<CustomerMasterCubit>().findAll(FindAllCustomerDto());
  }

  @override
  void initState() {
    super.initState();

    context.read<CustomerMasterCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CustomerMasterFilterCubit, CustomerMasterFilterState>(
          listener: (context, state) {
            context
                .read<CustomerMasterCubit>()
                .findAll(FindAllCustomerDto(search: state.search));
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
        appBar: CustomAppbar(
          search: SearchField(
            hintText: "Cari pelanggan...",
            debounceTime: 500,
            onChanged: (value) {
              context
                  .read<CustomerMasterFilterCubit>()
                  .setFilter(search: value);
            },
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

                                  return Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      width: 1,
                                      color: TColors.neutralLightMedium,
                                    ))),
                                    child: CustomerContactItem(
                                      customer: customer,
                                      onTap: customer.id == "-"
                                          ? null
                                          : () {
                                              Navigator.pushNamed(
                                                context,
                                                "/customers/detail",
                                                arguments: customer,
                                              );
                                            },
                                    ),
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
            onPressed: () async {
              bool? newCustomer =
                  await Navigator.pushNamed(context, "/customers/new") as bool?;
              if (newCustomer != true) return;
              _onRefresh();
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

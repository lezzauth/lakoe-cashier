import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/form/search_field.dart';
import 'package:lakoe_pos/common/widgets/shimmer/list_shimmer.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/wrapper/error_wrapper.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_master/customer_master_cubit.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_master/customer_master_filter_cubit.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_master/customer_master_filter_state.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_master/customer_master_state.dart';
import 'package:lakoe_pos/features/customers/common/widgets/customer_contact/customer_contact_item.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

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
  final TextEditingController _searchController = TextEditingController();
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
            controller: _searchController,
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
              builder: (context, state) => ErrorWrapper(
                connectionIssue: state is ConnectionIssue,
                fetchError: state is CustomerMasterLoadFailure,
                onRefresh: _onRefresh,
                child: switch (state) {
                  CustomerMasterLoadSuccess(:final customers) => customers
                          .isNotEmpty
                      ? ListView.builder(
                          itemCount: customers.length,
                          itemBuilder: (context, index) {
                            CustomerModel customer = customers.elementAt(index);

                            return CustomerContactItem(
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
                            );
                          },
                        )
                      : const EmptyList(
                          title: "Belum ada pelanggan, nih!",
                          subTitle: "Yuk! Daftarkan pelanggan kamu.",
                        ),
                  _ => ListShimmer(
                      crossAlignment: "center",
                      circleAvatar: true,
                      sizeAvatar: 40.0,
                      heightTitle: 16.0,
                      heightSubtitle: 12.0,
                    ),
                },
              ),
            ),
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

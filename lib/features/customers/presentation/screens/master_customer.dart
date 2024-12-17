import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/form/search_field.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/shimmer/list_shimmer.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/wrapper/error_wrapper.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_master/customer_master_cubit.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_master/customer_master_filter_cubit.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_master/customer_master_filter_state.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_master/customer_master_state.dart';
import 'package:lakoe_pos/features/customers/common/widgets/customer_contact/customer_contact_card.dart';
import 'package:lakoe_pos/features/customers/common/widgets/customer_contact/customer_contact_item.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

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
  final FocusNode _searchFocusNode = FocusNode();

  Future<void> _onRefresh() async {
    context.read<CustomerMasterCubit>().findAll(FindAllCustomerDto());
  }

  @override
  void initState() {
    super.initState();

    context.read<CustomerMasterCubit>().init();
  }

  void _handleChangeKeyword() {
    _searchFocusNode.requestFocus();
    _searchController.selection = TextSelection(
      baseOffset: 0,
      extentOffset: _searchController.text.length,
    );
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
            focusNode: _searchFocusNode,
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
              builder: (context, state) {
                return ErrorWrapper(
                  connectionIssue: state is ConnectionIssue,
                  fetchError: state is CustomerMasterLoadFailure,
                  onRefresh: _onRefresh,
                  child: () {
                    if (state is CustomerMasterLoadSuccess) {
                      final customers = state.customers;

                      if (customers.isNotEmpty) {
                        final filteredCustomers = customers
                            .where((customer) => customer.id != "-")
                            .toList();

                        if (filteredCustomers.isEmpty) {
                          return EmptyList(
                            image: SvgPicture.asset(TImages.catBox, width: 200),
                            title: "Belum ada pelanggan",
                            subTitle: "Yuk, buat data pelanggan pertamamu.",
                            action: TextButton(
                              onPressed: () async {
                                bool? newCustomer = await Navigator.pushNamed(
                                    context, "/customers/new") as bool?;
                                if (newCustomer != true) return;
                                _onRefresh();
                              },
                              child: TextActionL(
                                "Buat Baru",
                                color: TColors.primary,
                              ),
                            ),
                          );
                        }

                        return ResponsiveLayout(
                          mobile: ListView.builder(
                            itemCount: filteredCustomers.length,
                            itemBuilder: (context, index) {
                              CustomerModel customer = filteredCustomers[index];

                              return CustomerContactItem(
                                customer: customer,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    "/customers/detail",
                                    arguments: customer,
                                  );
                                },
                              );
                            },
                          ),
                          tablet: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 240,
                                  mainAxisExtent: 60,
                                  childAspectRatio: 240 / 60,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                ),
                                itemCount: filteredCustomers.length,
                                itemBuilder: (context, i) {
                                  CustomerModel customer = filteredCustomers[i];
                                  return CustomerContactCard(
                                    customer: customer,
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        "/customers/detail",
                                        arguments: customer,
                                      );
                                    },
                                  );
                                }),
                          ),
                        );
                      } else {
                        return EmptyList(
                          title: "Pencarian tidak ditemukan",
                          subTitle: "Coba cari dengan nama pelanggan yang lain",
                          action: TextButton(
                            onPressed: _handleChangeKeyword,
                            child: TextActionL(
                              "Ubah Pencarian",
                              color: TColors.primary,
                            ),
                          ),
                        );
                      }
                    } else {
                      return const ListShimmer(
                        crossAlignment: "center",
                        circleAvatar: true,
                        sizeAvatar: 40.0,
                        heightTitle: 16.0,
                        heightSubtitle: 12.0,
                      );
                    }
                  }(),
                );
              },
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

import 'package:category_repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_master/category_master_cubit.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_master/category_master_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_master/category_master_filter_state.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_master/category_master_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/formatters/category_icon_formatter.dart';

class CategoryMasterScreen extends StatelessWidget {
  const CategoryMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryMasterFilterCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) => switch (state) {
          AuthReady() => const CategoryMaster(),
          _ => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        },
      ),
    );
  }
}

class CategoryMaster extends StatefulWidget {
  const CategoryMaster({super.key});

  @override
  State<CategoryMaster> createState() => _CategoryMasterState();
}

class _CategoryMasterState extends State<CategoryMaster> {
  Future<void> onRefresh() async {
    AuthReady authState = context.read<AuthCubit>().state as AuthReady;
    CategoryMasterFilterState filterState =
        context.read<CategoryMasterFilterCubit>().state;

    context.read<CategoryMasterCubit>().findAll(FindAllCategoryDto(
          outletId: authState.outletId,
          search: filterState.search,
        ));
  }

  @override
  void initState() {
    super.initState();
    AuthReady authState = context.read<AuthCubit>().state as AuthReady;

    context.read<CategoryMasterCubit>().init(authState.outletId);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CategoryMasterFilterCubit, CategoryMasterFilterState>(
          listener: (context, state) {
            AuthReady authState = context.read<AuthCubit>().state as AuthReady;

            context.read<CategoryMasterCubit>().findAll(FindAllCategoryDto(
                  outletId: authState.outletId,
                  search: state.search,
                ));
          },
        )
      ],
      child: Scaffold(
        appBar: CustomAppbar(
          search: SearchField(
            hintText: "Cari kategori disini",
            debounceTime: 500,
            onChanged: (value) {
              context
                  .read<CategoryMasterFilterCubit>()
                  .setFilter(search: value);
            },
          ),
        ),
        body: Scrollbar(
          child: RefreshIndicator(
            backgroundColor: TColors.neutralLightLightest,
            onRefresh: onRefresh,
            child: BlocBuilder<CategoryMasterCubit, CategoryMasterState>(
                builder: (context, state) => switch (state) {
                      CategoryMasterLoadSuccess(:final categories) =>
                        CustomScrollView(
                          slivers: [
                            if (categories.isEmpty)
                              const EmptyList(
                                title: "Belum ada kategori, nih!",
                                subTitle: "Yuk! Masukan masukan kategori kamu.",
                              ),
                            if (categories.isNotEmpty)
                              SliverList.builder(
                                itemCount: categories.length,
                                itemBuilder: (context, index) {
                                  CategoryModel category =
                                      categories.elementAt(index);

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
                                      title: TextHeading4(category.name),
                                      subtitle: TextBodyM(
                                        "${(category.count?.products ?? 0).toString()} Produk",
                                        color: TColors.neutralDarkLight,
                                      ),
                                      onTap: () async {
                                        bool? updateCategory =
                                            await Navigator.pushNamed(
                                          context,
                                          "/categories/edit",
                                          arguments: category,
                                        ) as bool?;
                                        if (updateCategory != true) return;
                                        onRefresh();
                                      },
                                      leading: Container(
                                        height: 44,
                                        width: 44,
                                        decoration: BoxDecoration(
                                          color: TColors.highlightLightest,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Container(
                                          height: 16,
                                          width: 16,
                                          alignment: Alignment.center,
                                          child: SvgPicture.asset(
                                            TCategoryIconFormatter.getIcon(
                                              category.icon ?? '',
                                            ),
                                            height: 16,
                                            width: 16,
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      ),
                                      dense: true,
                                    ),
                                  );
                                },
                              )
                          ],
                        ),
                      CategoryMasterLoadFailure(:final error) => Center(
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
              bool? newCategory =
                  await Navigator.pushNamed(context, "/categories/new")
                      as bool?;
              if (newCategory != true) return;
              onRefresh();
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

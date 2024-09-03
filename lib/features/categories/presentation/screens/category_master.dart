import 'dart:developer';

import 'package:category_repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_cubit.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/formatters/category_icon_formatter.dart';

class CategoryMasterScreen extends StatefulWidget {
  const CategoryMasterScreen({super.key});

  @override
  State<CategoryMasterScreen> createState() => _CategoryMasterScreenState();
}

class _CategoryMasterScreenState extends State<CategoryMasterScreen> {
  Future<void> onFetchCategories() async {
    AuthState authState = context.read<AuthCubit>().state;
    if (authState is! AuthReady) return;

    return await context
        .read<CategoryCubit>()
        .findAll(FindAllCategoryDto(outletId: authState.outletId));
  }

  Future<void> onRefresh() async {
    await onFetchCategories();
  }

  @override
  void initState() {
    super.initState();
    onFetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        search: SearchField(
          hintText: "Cari kategori disini",
        ),
      ),
      body: Scrollbar(
        child: RefreshIndicator(
          backgroundColor: TColors.neutralLightLightest,
          onRefresh: onRefresh,
          child: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) => switch (state) {
                    CategoryLoadSuccess(:final categories) => CustomScrollView(
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
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        "/categories/edit",
                                        arguments: category,
                                      );
                                    },
                                    leading: Container(
                                      height: 44,
                                      width: 44,
                                      decoration: BoxDecoration(
                                        color: TColors.highlightLightest,
                                        borderRadius: BorderRadius.circular(8),
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
                    CategoryLoadFailure(:final error) => Center(
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
            Navigator.pushNamed(context, "/categories/new");
          },
          elevation: 0,
          child: const Icon(
            Icons.add,
            size: 24,
          ),
        ),
      ),
    );
  }
}

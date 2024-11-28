import 'package:category_repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/form/search_field.dart';
import 'package:lakoe_pos/common/widgets/shimmer/list_shimmer.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/common/widgets/wrapper/error_wrapper.dart';
import 'package:lakoe_pos/features/categories/application/cubit/category_master/category_master_cubit.dart';
import 'package:lakoe_pos/features/categories/application/cubit/category_master/category_master_filter_cubit.dart';
import 'package:lakoe_pos/features/categories/application/cubit/category_master/category_master_filter_state.dart';
import 'package:lakoe_pos/features/categories/application/cubit/category_master/category_master_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/formatters/category_icon_formatter.dart';

class CategoryMasterScreen extends StatelessWidget {
  const CategoryMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryMasterFilterCubit(),
      child: const CategoryMaster(),
    );
  }
}

class CategoryMaster extends StatefulWidget {
  const CategoryMaster({super.key});

  @override
  State<CategoryMaster> createState() => _CategoryMasterState();
}

class _CategoryMasterState extends State<CategoryMaster> {
  final TextEditingController _searchController = TextEditingController();
  Future<void> onRefresh() async {
    CategoryMasterFilterState filterState =
        context.read<CategoryMasterFilterCubit>().state;

    context.read<CategoryMasterCubit>().findAll(FindAllCategoryDto(
          search: filterState.search,
        ));
  }

  @override
  void initState() {
    super.initState();
    context.read<CategoryMasterCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CategoryMasterFilterCubit, CategoryMasterFilterState>(
          listener: (context, state) {
            context.read<CategoryMasterCubit>().findAll(FindAllCategoryDto(
                  search: state.search,
                ));
          },
        )
      ],
      child: Scaffold(
        appBar: CustomAppbar(
          search: SearchField(
            hintText: "Cari kategori disini…",
            controller: _searchController,
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
              builder: (context, state) => ErrorWrapper(
                connectionIssue: state is ConnectionIssue,
                fetchError: state is CategoryMasterLoadFailure,
                onRefresh: onRefresh,
                child: switch (state) {
                  CategoryMasterLoadSuccess(:final categories) =>
                    CustomScrollView(
                      slivers: [
                        if (categories.isEmpty)
                          BlocBuilder<CategoryMasterFilterCubit,
                              CategoryMasterFilterState>(
                            builder: (context, filterState) {
                              if (filterState.search != null &&
                                  filterState.search!.isNotEmpty) {
                                return SliverToBoxAdapter(
                                  child: const EmptyList(
                                    title: "Pencarian tidak ditemukan",
                                    subTitle:
                                        "Coba cari dengan nama kategori yang lain.",
                                  ),
                                );
                              }

                              return SliverToBoxAdapter(
                                child: const EmptyList(
                                  title: "Belum ada kategori, nih!",
                                  subTitle:
                                      "Yuk! Masukan masukkan kategori kamu.",
                                ),
                              );
                            },
                          ),
                        if (categories.isNotEmpty)
                          SliverList.builder(
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              List<CategoryModel> sortedCategories =
                                  List.from(categories);
                              sortedCategories.sort((a, b) {
                                if (a.name.contains("Umum")) {
                                  return -1;
                                } else if (b.name.contains("Umum")) {
                                  return 1;
                                }
                                return 0;
                              });

                              CategoryModel category =
                                  sortedCategories.elementAt(index);

                              return Column(
                                children: [
                                  ListTile(
                                    title: TextHeading4(category.name),
                                    subtitle: TextBodyM(
                                      "${(category.count?.products ?? 0).toString()} Produk",
                                      color: TColors.neutralDarkLight,
                                    ),
                                    onTap: () async {
                                      if (category.name.contains("Umum")) {
                                        CustomToast.show(
                                          "Kategori Umum tidak bisa diedit.",
                                          position: "bottom",
                                        );
                                      } else {
                                        bool? updateCategory =
                                            await Navigator.pushNamed(
                                          context,
                                          "/categories/edit",
                                          arguments: category,
                                        ) as bool?;
                                        if (updateCategory != true) return;
                                        onRefresh();
                                      }
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
                                  const Divider(
                                    color: TColors.neutralLightMedium,
                                    indent: 16.0,
                                    height: 1,
                                  ),
                                ],
                              );
                            },
                          )
                      ],
                    ),
                  _ => ListShimmer(
                      crossAlignment: "center",
                      sizeAvatar: 44.0,
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
              int? newCategoryId =
                  await Navigator.pushNamed(context, "/categories/new") as int?;
              if (newCategoryId == null) return;
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

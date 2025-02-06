import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:app_data_provider/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/error_display/error_display.dart';
import 'package:lakoe_pos/common/widgets/form/search_field.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/bill/application/cubit/bill_master/bill_master_cubit.dart';
import 'package:lakoe_pos/features/bill/application/cubit/bill_master/bill_master_state.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_filter_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_filter_state.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_state.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_state.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/content/cart_content_tablet.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/footer/cart_footer.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/category/cashier_category_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/category/cashier_category_state.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/order/cashier_order_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/order/cashier_order_state.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_filter_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_filter_state.dart';
import 'package:lakoe_pos/features/cashier/presentation/widgets/appbar/explore_product_appbar.dart';
import 'package:lakoe_pos/features/cashier/presentation/widgets/drawer/explore_product_drawer_tablet.dart';
import 'package:lakoe_pos/features/cashier/presentation/widgets/open_order_list.dart';
import 'package:lakoe_pos/features/cashier/presentation/widgets/cashier_product_grid.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_detail/order_detail_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_detail/order_detail_state.dart';
import 'package:lakoe_pos/features/orders/data/arguments/order_detail_argument.dart';
import 'package:lakoe_pos/features/orders/presentation/screens/tablet/order_detail_tablet.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_cubit.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_state.dart';
import 'package:lakoe_pos/features/payment_method/common/widgets/payment_method_not_available.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/filter/product_category_filter.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/print/bill.dart';

class ExploreProductTablet extends StatelessWidget {
  const ExploreProductTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartDetailFilterCubit(),
      child: const ExploreProductTabletContent(),
    );
  }
}

class ExploreProductTabletContent extends StatefulWidget {
  const ExploreProductTabletContent({super.key});

  @override
  State<ExploreProductTabletContent> createState() =>
      _ExploreProductTabletContentState();
}

class _ExploreProductTabletContentState
    extends State<ExploreProductTabletContent> {
  final AppDataProvider _appDataProvider = AppDataProvider();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  bool isBottomSheetVisible = false;

  @override
  void initState() {
    super.initState();
    context.read<OrderDetailOpenedCubit>().unselectOrderId();
    _searchController.clear();
    _onRefresh();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _onCartSaved() async {
    _searchController.clear();
    context.read<CashierProductFilterCubit>().setFilter(name: "");

    CartState cartState = context.read<CartCubit>().state;
    CartDetailFilterState filterState =
        context.read<CartDetailFilterCubit>().state;

    await context.read<CartDetailCubit>().saveOrder(
          carts: cartState.carts,
          type: filterState.type,
          customerId: filterState.customer?.id,
          tableId: filterState.table?.id,
        );
  }

  Future<void> _onRefresh() async {
    if (!mounted) return;

    CashierProductFilterState filterState =
        context.read<CashierProductFilterCubit>().state;

    context.read<CashierOrderCubit>().findAll();
    context.read<CashierCategoryCubit>().findAll();
    await context.read<CashierProductCubit>().findAll(
          categoryId: filterState.categoryId,
          name: filterState.name,
        );
  }

  Future<void> openSettings() async {
    final intent = AndroidIntent(
      action: 'android.settings.SETTINGS',
      flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
    );
    await intent.launch();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OrderDetailOpenedCubit, OrderDetailOpenedState>(
          listener: (context, state) {},
        ),
        BlocListener<CartDetailCubit, CartDetailState>(
          listener: (context, state) async {
            if (state is CartDetailActionSuccess) {
              context.read<CartCubit>().reset();
              context.read<CashierOrderCubit>().findAll();
              context.read<OrderDetailCubit>().findOne(state.res.id);
            }

            if (state is CartDetailCompleteActionSuccess) {
              context.read<CartCubit>().reset();
              context.read<OrderDetailCubit>().findOne(state.res.order.id);
            }

            if (state is CartDetailActionFailure &&
                    state.error.contains("402") ||
                state is CartDetailCompleteActionFailure &&
                    state.error.contains("402")) {
              if (state is CartDetailCompleteActionFailure) {
                Navigator.pop(context);
              }

              final activePackage = await _appDataProvider.activePackage;

              String limit = "25";

              if (activePackage == "GROW") {
                limit = "50";
              }

              if (!context.mounted) return;

              bool isExpired = state is CartDetailActionFailure &&
                      state.error.contains("expired") ||
                  state is CartDetailCompleteActionFailure &&
                      state.error.contains("expired");

              String title = "Pesanan lagi ramai banget, ya?";
              String description =
                  "Sayangnya, paket kamu saat ini cuma bisa buat $limit pesanan dalam sehari. Yuk! upgrade paket biar penjualan tidak terganggu.";

              if (isExpired) {
                title = "Yah! masa aktif paket habis";
                description =
                    "Paket $activePackage kamu sudah tidak aktif lagi. Yuk perpanjang atau upgrade paket untuk terus menikmati fitur Lakoe.";
              }

              showModalBottomSheet(
                context: context,
                enableDrag: false,
                isDismissible: false,
                builder: (context) {
                  return PopScope(
                    canPop: false,
                    onPopInvokedWithResult: (didPop, result) async {},
                    child: CustomBottomsheet(
                      hasGrabber: false,
                      child: ErrorDisplay(
                        imageSrc: TImages.limitQuota,
                        title: title,
                        description: description,
                        actionTitlePrimary: "Lihat Paket",
                        onActionPrimary: () {
                          context.read<CartCubit>().reset();

                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (isExpired && activePackage != "LITE") {
                              Navigator.pushNamed(
                                context,
                                "/account/active_package",
                                arguments: {'packageName': activePackage},
                              );
                            } else if (activePackage == "GROW") {
                              Navigator.popAndPushNamed(
                                context,
                                "/packages/upgrade",
                                arguments: {
                                  'currentPackage': "GROW",
                                  'upgradePakcage': "PRO",
                                },
                              );
                            } else {
                              Navigator.popAndPushNamed(context, "/packages");
                            }
                          });
                        },
                        actionTitleSecondary: "Nanti Saja",
                        onActionSecondary: () {
                          context.read<CartCubit>().reset();
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        BlocListener<CashierOrderCubit, CashierOrderState>(
          listener: (BuildContext context, CashierOrderState state) {
            if (state is ConnectionIssue && !isBottomSheetVisible) {
              isBottomSheetVisible = true;
              if (!mounted) return;

              showModalBottomSheet(
                context: context,
                enableDrag: false,
                isDismissible: false,
                builder: (context) {
                  return PopScope(
                    canPop: false,
                    onPopInvokedWithResult: (didPop, result) async {},
                    child: CustomBottomsheet(
                      hasGrabber: false,
                      child: ErrorDisplay(
                        imageSrc: TImages.noConnection,
                        title: "Koneksi internet aman ngga?",
                        description:
                            "Coba cek WiFi atau kuota internet kamu dulu terus bisa dicoba lagi, ya!",
                        actionTitlePrimary: "Pengaturan",
                        onActionPrimary: () {
                          isBottomSheetVisible = false;
                          Navigator.pop(context);
                          openSettings();
                        },
                        actionTitleSecondary: "Coba Lagi",
                        onActionSecondary: () async {
                          isBottomSheetVisible = false;
                          Navigator.pop(context);
                          await Future.delayed(Duration(seconds: 2));
                          _onRefresh();
                        },
                      ),
                    ),
                  );
                },
              ).whenComplete(() => isBottomSheetVisible = false);
              return;
            }
          },
        ),
        BlocListener<OrderDetailCubit, OrderDetailState>(
          listener: (context, state) {
            if (state is OrderDetailLoadSuccess) {
              OrderDetailOpenedState openDetail =
                  context.read<OrderDetailOpenedCubit>().state;
              BillMasterState billState = context.read<BillMasterCubit>().state;

              bool openDetailOder = openDetail.selectedId != null;

              if (billState.printOrderTicket && !openDetailOder) {
                TBill.tickerOrderPrint(context, state.order);
              }
            }
          },
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: TColors.neutralLightLightest,
          endDrawerEnableOpenDragGesture: false,
          endDrawer: ExploreProductDrawerTablet(),
          body: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Scaffold(
                  backgroundColor: TColors.neutralLightLight,
                  appBar: ExploreProductAppbar(),
                  body: Scrollbar(
                    child: RefreshIndicator(
                      onRefresh: _onRefresh,
                      backgroundColor: TColors.neutralLightLightest,
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Container(
                              color: TColors.neutralLightLight,
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 12.0),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextHeading3("Daftar Pesanan")
                                      ],
                                    ),
                                  ),
                                  BlocBuilder<OrderDetailOpenedCubit,
                                          OrderDetailOpenedState>(
                                      builder: (context, state) {
                                    return CashierOpenOrderList(
                                      selectedOrderId: state.selectedId,
                                      onTap: (value) {
                                        final cubit = context
                                            .read<OrderDetailOpenedCubit>();

                                        bool selected =
                                            value.id == state.selectedId;

                                        if (state.selectedId == null ||
                                            !selected) {
                                          cubit.selectOrderId(value.id);
                                        } else {
                                          cubit.unselectOrderId();
                                        }
                                      },
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              color: TColors.neutralLightLight,
                              child: BlocBuilder<CashierProductFilterCubit,
                                  CashierProductFilterState>(
                                builder: (context, filterState) {
                                  return BlocBuilder<CashierCategoryCubit,
                                      CashierCategoryState>(
                                    builder: (context, state) {
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: ProductCategoryFilter(
                                              value: filterState.categoryId,
                                              onChanged: (value) {
                                                context
                                                    .read<
                                                        CashierProductFilterCubit>()
                                                    .setFilter(
                                                        categoryId: value);
                                              },
                                              categories: state
                                                      is CashierCategoryLoadSuccess
                                                  ? state.categories
                                                  : [],
                                              errorText: state
                                                      is CashierCategoryLoadFailure
                                                  ? state.error
                                                  : "",
                                              loading: state
                                                  is CashierCategoryLoadInProgress,
                                            ),
                                          ),
                                          Container(
                                            width: 260,
                                            padding: EdgeInsets.only(
                                              right: 24,
                                              left: 12,
                                            ),
                                            child: SearchField(
                                              hintText: "Cari menu disini…",
                                              controller: _searchController,
                                              focusNode: _searchFocusNode,
                                              debounceTime: 500,
                                              onChanged: (value) {
                                                context
                                                    .read<
                                                        CashierProductFilterCubit>()
                                                    .setFilter(name: value);
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          CashierProductGrid(
                            searchController: _searchController,
                            searchFocusNode: _searchFocusNode,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, stateCart) {
                  return BlocBuilder<OrderDetailOpenedCubit,
                      OrderDetailOpenedState>(builder: (context, state) {
                    return Visibility(
                      visible: stateCart.carts.isNotEmpty &&
                          state.selectedId == null,
                      child: SizedBox(
                        width: 400,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: CartContentTablet(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                              child: CartFooter(
                                labelButtonCart: "Proses Pesanan",
                                onCompleted: (value) {
                                  onCompleteOrder(value);
                                },
                                onSaved: _onCartSaved,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
              BlocBuilder<OrderDetailOpenedCubit, OrderDetailOpenedState>(
                  builder: (context, state) {
                return Visibility(
                  visible: state.selectedId != null,
                  child: OrderDetailTablet(
                    key: ValueKey(state.selectedId),
                    arguments: OrderDetailArgument(
                      id: state.selectedId ?? "",
                      isCashier: true,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onCompleteOrder(double value) async {
    PaymentMethodState state = context.read<PaymentMethodCubit>().state;

    if (state is PaymentMethodLoadSuccess) {
      final activePaymentMethods =
          state.paymentMethod.where((method) => method.isActive).toList();

      if (activePaymentMethods.isEmpty) {
        return showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return const CustomBottomsheet(
              child: PaymentMethodNotAvailable(),
            );
          },
        );
      }
      _scaffoldKey.currentState!.openEndDrawer();
      _searchController.clear();
      context.read<CashierProductFilterCubit>().setFilter(name: "");
    } else {
      return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return const CustomBottomsheet(
            child: PaymentMethodNotAvailable(),
          );
        },
      );
    }
  }
}

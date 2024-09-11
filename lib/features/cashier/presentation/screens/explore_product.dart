import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/responsive/responsive_layout.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/category/cashier_category_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/category/cashier_category_state.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/order/cashier_order_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_filter_state.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/screens/tablet/explore_product.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/appbar/explore_product_appbar.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/button/cart_count_floating_action_button.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/open_order_list.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/product_list.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/screens/mobile/explore_product.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/filter/product_category_filter.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class ExploreProductScreen extends StatefulWidget {
  const ExploreProductScreen({super.key});

  @override
  State<ExploreProductScreen> createState() => _ExploreProductScreenState();
}

class _ExploreProductScreenState extends State<ExploreProductScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CashierProductFilterCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) => switch (state) {
          AuthReady() => const ExploreProduct(),
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

class ExploreProduct extends StatefulWidget {
  const ExploreProduct({super.key});

  @override
  State<ExploreProduct> createState() => _ExploreProductState();
}

class _ExploreProductState extends State<ExploreProduct> {
  @override
  void initState() {
    super.initState();

    AuthReady authState = context.read<AuthCubit>().state as AuthReady;
    context.read<CashierOrderCubit>().init();
    context.read<CashierProductCubit>().init(authState.outletId);
    context.read<CashierCategoryCubit>().init(authState.outletId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, authState) {
      return MultiBlocListener(
        listeners: [
          BlocListener<CashierProductFilterCubit, CashierProductFilterState>(
            listener: (context, state) {
              if (authState is! AuthReady) return;
              context.read<CashierProductCubit>().findAll(
                    outletId: authState.outletId,
                    categoryId: state.categoryId,
                    name: state.name,
                  );
            },
          ),
        ],
        child: const ResponsiveLayout(
          mobile: ExploreProductMobile(),
          tablet: ExploreProductTablet(),
        ),
      );
    });
  }
}

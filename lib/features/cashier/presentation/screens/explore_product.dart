import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/responsive/responsive_layout.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/category/cashier_category_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/order/cashier_order_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_filter_state.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/screens/tablet/explore_product.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/screens/mobile/explore_product.dart';

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
      child: const ExploreProduct(),
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

    context.read<CashierOrderCubit>().init();
    context.read<CashierProductCubit>().init();
    context.read<CashierCategoryCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CashierProductFilterCubit, CashierProductFilterState>(
          listener: (context, state) {
            context.read<CashierProductCubit>().findAll(
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
  }
}

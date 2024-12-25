import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/category/cashier_category_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/order/cashier_order_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_filter_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_filter_state.dart';
import 'package:lakoe_pos/features/cashier/presentation/screens/tablet/explore_product_tablet.dart';
import 'package:lakoe_pos/features/cashier/presentation/screens/mobile/explore_product_mobile.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_cubit.dart';

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
  DateTime? lastBackPressed;

  @override
  void initState() {
    super.initState();
    context.read<CashierOrderCubit>().init();
    context.read<CashierProductCubit>().init();
    context.read<CashierCategoryCubit>().init();
    context.read<PaymentMethodCubit>().findAll();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        final now = DateTime.now();
        if (lastBackPressed == null ||
            now.difference(lastBackPressed!) > const Duration(seconds: 2)) {
          lastBackPressed = now;
          CustomToast.show(
            "Tekan sekali lagi untuk keluar halaman kasir",
            position: 'bottom',
            duration: 2,
          );
          return;
        } else {
          context.read<CartCubit>().reset();
          Navigator.pushNamedAndRemoveUntil(
            context,
            "/home",
            (route) => false,
          );
        }
      },
      child: MultiBlocListener(
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
      ),
    );
  }
}

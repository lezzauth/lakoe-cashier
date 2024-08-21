import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/screens/completing_data.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/on_boarding/screens/on_boarding.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/otp_input/screens/otp_input.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/screens/cart.dart';
import 'package:point_of_sales_cashier/features/customers/presentation/screens/customer_detail.dart';
import 'package:point_of_sales_cashier/features/customers/presentation/screens/master_customer.dart';
import 'package:point_of_sales_cashier/features/customers/presentation/screens/new_customer.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/screens/dashboard.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/screens/transaction_date.dart';
import 'package:point_of_sales_cashier/features/products/presentation/screens/explore_product.dart';
import 'package:point_of_sales_cashier/features/products/presentation/screens/master_product.dart';
import 'package:point_of_sales_cashier/features/products/presentation/screens/new_product.dart';
import 'package:point_of_sales_cashier/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Point of Sales",
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: "/home",
      routes: {
        "/": (context) => const OnBoardingScreen(),
        "/otp-input": (context) => const OtpInputScreen(),
        "/completing-data": (context) => const CompletingDataScreen(),
        "/home": (context) => const DashboardScreen(),
        "/home/transaction-date": (context) => const TransactionDateScreen(),
        "/explore-products": (context) => const ExploreProductScreen(),
        "/cart": (context) => const CartScreen(),
        "/products": (context) => const MasterProductScreen(),
        "/products/new": (context) => const NewProductScreen(),
        "/customers": (context) => const MasterCustomerScreen(),
        "/customers/new": (context) => const NewCustomerScreen(),
        "/customers/detail": (context) => const CustomerDetailScreen(),
      },
    );
  }
}

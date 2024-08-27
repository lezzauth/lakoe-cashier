import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/completing_data/completing_data_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/screens/completing_data.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/on_boarding/screens/on_boarding.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/otp_input/screens/otp_input.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/screens/cart.dart';
import 'package:point_of_sales_cashier/features/customers/presentation/screens/customer_detail.dart';
import 'package:point_of_sales_cashier/features/customers/presentation/screens/master_customer.dart';
import 'package:point_of_sales_cashier/features/customers/presentation/screens/new_customer.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/screens/dashboard.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/screens/transaction_date.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/screens/order_detail.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/screens/order_master.dart';
import 'package:point_of_sales_cashier/features/payments/presentation/screens/bank_transfer_payment.dart';
import 'package:point_of_sales_cashier/features/payments/presentation/screens/qris_payment.dart';
import 'package:point_of_sales_cashier/features/payments/presentation/screens/success_confirmation_payment.dart';
import 'package:point_of_sales_cashier/features/products/presentation/screens/explore_product.dart';
import 'package:point_of_sales_cashier/features/products/presentation/screens/master_product.dart';
import 'package:point_of_sales_cashier/features/products/presentation/screens/new_product.dart';
import 'package:point_of_sales_cashier/features/settings/presentation/screens/settings.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/screens/table_master.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/screens/table_new.dart';
import 'package:point_of_sales_cashier/utils/http/http.dart';
import 'package:point_of_sales_cashier/utils/theme/theme.dart';
import 'package:token_provider/token_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            authenticationRepository: AuthenticationRepositoryImpl(
              dio: dio,
              tokenProvider: TokenProvider(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => CompletingDataCubit(),
        )
      ],
      child: MaterialApp(
        title: "Point of Sales",
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeMode.light,
        initialRoute: "/",
        routes: {
          "/": (context) => const OnBoardingScreen(),
          "/otp-input": (context) => const OtpInputScreen(),
          "/completing-data": (context) => const CompletingDataScreen(),
          "/home": (context) => const DashboardScreen(),
          "/home/transaction-date": (context) => const TransactionDateScreen(),
          "/explore-products": (context) => const ExploreProductScreen(),
          "/cart": (context) => const CartScreen(),
          // products
          "/products": (context) => const MasterProductScreen(),
          "/products/new": (context) => const NewProductScreen(),
          // customers
          "/customers": (context) => const MasterCustomerScreen(),
          "/customers/new": (context) => const NewCustomerScreen(),
          "/customers/detail": (context) => const CustomerDetailScreen(),
          // orders
          "/orders": (context) => const OrderMasterScreen(),
          "/orders/detail": (context) => const OrderDetailScreen(),

          // payments
          "/payments/qris": (context) => const QrisPaymentScreen(),
          "/payments/bank_transfer": (context) =>
              const BankTransferPaymentScreen(),
          "/payments/success_confirmation": (context) =>
              const SuccessConfirmationPaymentScreen(),

          // tables
          "/tables": (context) => const TableMasterScreen(),
          "/tables/new": (context) => const TableNewScreen(),

          // settings
          "/settings": (context) => const SettingsScreen(),
        },
      ),
    );
  }
}

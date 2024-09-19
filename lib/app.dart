import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:point_of_sales_cashier/application/cubit/bank_list_cubit.dart';
import 'package:point_of_sales_cashier/features/account/presentation/screens/account_edit.dart';
import 'package:point_of_sales_cashier/features/account/presentation/screens/account_master.dart';
import 'package:point_of_sales_cashier/features/account/presentation/screens/form/name_edit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/completing_data/completing_data_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/screens/completing_data.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/on_boarding/screens/on_boarding.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/otp_input/screens/otp_input.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_cubit.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/presentation/screens/bank_account_detail.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/presentation/screens/bank_account_master.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/presentation/screens/bank_account_new.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/screens/bill_edit.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/screens/bill_master.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/customer/cart_customer_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/screens/cart.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/category/cashier_category_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/order/cashier_order_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_master/category_master_cubit.dart';
import 'package:point_of_sales_cashier/features/categories/presentation/screens/category_edit.dart';
import 'package:point_of_sales_cashier/features/categories/presentation/screens/category_master.dart';
import 'package:point_of_sales_cashier/features/categories/presentation/screens/category_new.dart';
import 'package:point_of_sales_cashier/features/charges/application/cubit/charge_master/charge_master_cubit.dart';
import 'package:point_of_sales_cashier/features/charges/presentation/screens/charge_master.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_detail/customer_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/customers/application/cubit/customer_master/customer_master_cubit.dart';
import 'package:point_of_sales_cashier/features/customers/presentation/screens/customer_detail.dart';
import 'package:point_of_sales_cashier/features/customers/presentation/screens/master_customer.dart';
import 'package:point_of_sales_cashier/features/customers/presentation/screens/new_customer.dart';
import 'package:point_of_sales_cashier/features/employees/presentation/screens/detail_employee.dart';
import 'package:point_of_sales_cashier/features/employees/presentation/screens/master_employee.dart';
import 'package:point_of_sales_cashier/features/employees/presentation/screens/new_employee.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/screens/open_cashier_pin.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/screens/dashboard.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/screens/transaction_date.dart';
import 'package:point_of_sales_cashier/features/notifications/presentation/screens/notification_master.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_detail/order_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_master/order_master_cubit.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/screens/order_detail.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/screens/order_master.dart';
import 'package:point_of_sales_cashier/features/payment_method/presentation/screens/payment_method_master.dart';
import 'package:point_of_sales_cashier/features/payments/presentation/screens/bank_transfer_payment.dart';
import 'package:point_of_sales_cashier/features/payments/presentation/screens/qris_payment.dart';
import 'package:point_of_sales_cashier/features/payments/presentation/screens/success_confirmation_payment.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/category/product_master_category_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/screens/explore_product.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_master/product_master_cubit.dart';
import 'package:point_of_sales_cashier/features/products/presentation/screens/product_edit.dart';
import 'package:point_of_sales_cashier/features/products/presentation/screens/product_master.dart';
import 'package:point_of_sales_cashier/features/products/presentation/screens/new_product.dart';
import 'package:point_of_sales_cashier/features/redirect/presentation/screens/redirect.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_master/report_master_cubit.dart';
import 'package:point_of_sales_cashier/features/reports/data/arguments.dart';
import 'package:point_of_sales_cashier/features/reports/presentation/screens/report_best_seller.dart';
import 'package:point_of_sales_cashier/features/reports/presentation/screens/report_product_sales.dart';
import 'package:point_of_sales_cashier/features/reports/presentation/screens/report_master.dart';
import 'package:point_of_sales_cashier/features/settings/presentation/screens/settings.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master_location/table_master_location_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/screens/table_edit.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/screens/table_master.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/screens/table_new.dart';
import 'package:point_of_sales_cashier/features/taxes/application/cubit/tax_master/tax_master_cubit.dart';
import 'package:point_of_sales_cashier/features/taxes/presentation/screens/tax_master.dart';
import 'package:point_of_sales_cashier/utils/theme/theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => CompletingDataCubit()),

        // Category Master
        BlocProvider(create: (context) => CategoryMasterCubit()),

        // Order Master
        BlocProvider(create: (context) => OrderMasterCubit()),

        // Order Detail
        BlocProvider(create: (context) => OrderDetailCubit()),

        // Customer Master
        BlocProvider(create: (context) => CustomerMasterCubit()),

        // Customer Detail
        BlocProvider(create: (context) => CustomerDetailCubit()),

        // Product Master
        BlocProvider(create: (context) => ProductMasterCubit()),
        BlocProvider(create: (context) => ProductMasterCategoryCubit()),

        // Cashier
        BlocProvider(create: (context) => CashierCubit()),
        BlocProvider(create: (context) => CashierOrderCubit()),
        BlocProvider(create: (context) => CashierProductCubit()),
        BlocProvider(create: (context) => CashierCategoryCubit()),

        // Cart
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => CartDetailCubit()),
        BlocProvider(create: (context) => CartCustomerCubit()),

        // Table Master
        BlocProvider(create: (context) => TableMasterCubit()),
        BlocProvider(create: (context) => TableMasterLocationCubit()),

        // Bank Account Master
        BlocProvider(create: (context) => BankAccountMasterCubit()),
        BlocProvider(create: (context) => BankListCubit()),

        // Tax Master
        BlocProvider(create: (context) => TaxMasterCubit()),

        // Charge Master
        BlocProvider(create: (context) => ChargeMasterCubit()),

        // Report Master
        BlocProvider(create: (context) => ReportMasterCubit()),
      ],
      child: MaterialApp(
        title: "Point of Sales",
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeMode.light,
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale("id"), Locale('en')],
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          ],
        ),
        routes: {
          "/": (context) => const RedirectScreen(),
          "/on-boarding": (context) => const OnBoardingScreen(),
          "/otp-input": (context) => const OtpInputScreen(),
          "/completing-data": (context) => const CompletingDataScreen(),
          "/cashier": (context) => const DashboardScreen(),
          "/cashier/open-cashier-pin": (context) =>
              const OpenCashierPinScreen(),
          "/cashier/transaction-date": (context) =>
              const TransactionDateScreen(),
          "/cashier/explore-products": (context) =>
              const ExploreProductScreen(),
          "/cart": (context) => const CartScreen(),
          // products
          "/products": (context) => const ProductMasterScreen(),
          "/products/new": (context) => const NewProductScreen(),
          "/products/edit": (context) => const ProductEditScreen(),

          // categories
          "/categories": (context) => const CategoryMasterScreen(),
          "/categories/new": (context) => const CategoryNewScreen(),
          "/categories/edit": (context) => const CategoryEditScreen(),

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
          "/tables/edit": (context) => const TableEditScreen(),

          // settings
          "/settings": (context) => const SettingsScreen(),

          // payment method
          "/payment_method": (context) => const PaymentMethodMasterScreen(),

          // bill
          "/bill": (context) => const BillMasterScreen(),
          "/bill/edit": (context) => const BillEditScreen(),

          // employee
          "/employee": (context) => const MasterEmployeScreen(),
          "/employee/new": (context) => const NewEmployeeScreen(),
          "/employee/detail": (context) => const DetailEmployeeScreen(),

          // bank accounts
          "/bank_accounts": (context) => const BankAccountMasterScreen(),
          "/bank_accounts/new": (context) => const BankAccountNewScreen(),
          "/bank_accounts/detail": (context) => const BankAccountDetailScreen(),

          // taxes
          "/taxes": (context) => const TaxMasterScreen(),

          // charges
          "/charges": (context) => const ChargeMasterScreen(),

          // Profile & Account
          "/account": (context) => const AccountMasterScreen(),
          "/account/edit": (context) => const AccountEditScreen(),
          "/account/edit/name": (context) => const NameEditScreen(),

          // reports
          "/reports": (context) => const ReportMasterScreen(),
          "/reports/best_seller": (context) => const ReportBestSellerScreen(),
          "/reports/best_seller/detail": (context) => ReportProductSalesScreen(
                arguments: ModalRoute.of(context)!.settings.arguments
                    as ReportProductSalesArguments,
              ),

          // Notifications
          "/notifications": (context) => const NotificationMasterScreen(),
        },
      ),
    );
  }
}

import 'package:dio_provider/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:point_of_sales_cashier/application/cubit/bank_list_cubit.dart';
import 'package:point_of_sales_cashier/features/account/presentation/screens/account_edit.dart';
import 'package:point_of_sales_cashier/features/account/presentation/screens/account_master.dart';
import 'package:point_of_sales_cashier/features/account/presentation/screens/form/email_edit.dart';
import 'package:point_of_sales_cashier/features/account/presentation/screens/form/name_edit.dart';
import 'package:point_of_sales_cashier/features/account/presentation/screens/form/phone_number_edit.dart';
import 'package:point_of_sales_cashier/features/account/presentation/screens/form/pin_edit.dart';
import 'package:point_of_sales_cashier/features/ai_chatbot/application/cubit/whatsapp/whatsapp_session_cubit.dart';
import 'package:point_of_sales_cashier/features/ai_chatbot/presentation/screens/ai_chatbot_master.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/data/arguments/completing_data_argument.dart';
import 'package:point_of_sales_cashier/features/authentication/data/arguments/otp_input_argument.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/completing_data/screens/completing_data.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/on_boarding/screens/on_boarding.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/on_boarding/screens/privacy_policy.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/on_boarding/screens/terms_condition.dart';
import 'package:point_of_sales_cashier/features/authentication/presentation/otp_input/screens/otp_input.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_cubit.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/data/arguments/bank_account_detail_argument.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/presentation/screens/bank_account_detail.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/presentation/screens/bank_account_master.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/presentation/screens/bank_account_new.dart';
import 'package:point_of_sales_cashier/features/bill/application/cubit/bill_master/bill_master_cubit.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/screens/bill_edit.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/screens/bill_master.dart';
import 'package:point_of_sales_cashier/features/checkout/application/purchase_cubit.dart';
import 'package:point_of_sales_cashier/features/checkout/presentation/screens/chekcout_master.dart';
import 'package:point_of_sales_cashier/features/checkout/presentation/screens/payment_confirmation.dart';
import 'package:point_of_sales_cashier/features/checkout/presentation/screens/payment_prepared.dart';
import 'package:point_of_sales_cashier/features/checkout/presentation/screens/payment_success.dart';
import 'package:point_of_sales_cashier/features/employees/data/arguments/employee_detail_argument.dart';
import 'package:point_of_sales_cashier/features/employees/data/arguments/employee_edit_argument.dart';
import 'package:point_of_sales_cashier/features/employees/presentation/screens/employee_edit.dart';
import 'package:point_of_sales_cashier/features/home/application/cubit/onboarding_transaction/onboarding_transaction_cubit.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/screens/onboarding_transaction.dart';
import 'package:point_of_sales_cashier/features/online_shop/application/cubit/shop_order_master_cubit/shop_order_master_cubit.dart';
import 'package:point_of_sales_cashier/features/online_shop/data/arguments/online_shop_ai_sop_new_argument.dart';
import 'package:point_of_sales_cashier/features/online_shop/data/arguments/online_shop_order_detail_argument.dart';
import 'package:point_of_sales_cashier/features/online_shop/data/arguments/online_shop_order_track_argument.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/screens/online_shop_ai_config.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/screens/online_shop_ai_config/online_shop_ai_description.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/screens/online_shop_ai_config/online_shop_ai_faq.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/screens/online_shop_ai_config/online_shop_ai_glossary.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/screens/online_shop_ai_config/online_shop_ai_language_style.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/screens/online_shop_ai_config/online_shop_ai_sop.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/screens/online_shop_ai_config/online_shop_ai_sop_new.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/screens/online_shop_cs_master.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/screens/online_shop_master.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/screens/online_shop_order_detail.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/screens/online_shop_order_master.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/screens/online_shop_order_track.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/screens/preview_proof_transfer.dart';
import 'package:point_of_sales_cashier/features/packages/application/cubit/package_detail/package_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/packages/application/cubit/package_master_cubit.dart';
import 'package:point_of_sales_cashier/features/packages/boost/presentation/screens/boost_detail.dart';
import 'package:point_of_sales_cashier/features/packages/presentation/screens/package_detail.dart';
import 'package:point_of_sales_cashier/features/packages/presentation/screens/package_master.dart';
import 'package:point_of_sales_cashier/features/payments/data/arguments/success_confirmation_payment_argument.dart';
import 'package:point_of_sales_cashier/features/print/application/cubit/print_master/print_master_cubit.dart';
import 'package:point_of_sales_cashier/features/print/presentation/screens/print_master.dart';
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
import 'package:point_of_sales_cashier/features/employees/application/cubit/employee_master/employee_master_cubit.dart';
import 'package:point_of_sales_cashier/features/employees/presentation/screens/detail_employee.dart';
import 'package:point_of_sales_cashier/features/employees/presentation/screens/master_employee.dart';
import 'package:point_of_sales_cashier/features/employees/presentation/screens/new_employee.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/screens/open_cashier_pin.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/screens/dashboard.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/screens/transaction_date.dart';
import 'package:point_of_sales_cashier/features/account/manage_account/presentation/screens/delete_account.dart';
import 'package:point_of_sales_cashier/features/account/manage_account/presentation/screens/delete_account_reason.dart';
import 'package:point_of_sales_cashier/features/account/manage_account/presentation/screens/manage_account.dart';
import 'package:point_of_sales_cashier/features/notifications/presentation/screens/notification_master.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_detail/order_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_master/order_master_cubit.dart';
import 'package:point_of_sales_cashier/features/orders/data/arguments/order_add_item_argument.dart';
import 'package:point_of_sales_cashier/features/orders/data/arguments/order_detail_argument.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/screens/order_add_item.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/screens/order_detail.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/screens/order_master.dart';
import 'package:point_of_sales_cashier/features/payment_method/presentation/screens/payment_method_master.dart';
import 'package:point_of_sales_cashier/features/payments/data/arguments/bank_transfer_payment_argument.dart';
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
import 'package:point_of_sales_cashier/utils/helpers/navigator_observer.dart';
import 'package:point_of_sales_cashier/utils/theme/theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),

        // Category Master
        BlocProvider(create: (context) => CategoryMasterCubit()),

        // Order Master
        BlocProvider(create: (context) => OrderMasterCubit()),
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
        BlocProvider(create: (context) => OnboardingTransactionCubit()),

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

        // Employee Master
        BlocProvider(create: (context) => EmployeeMasterCubit()),

        // Print Master
        BlocProvider(create: (context) => PrintMasterCubit()),

        // Bill Master
        BlocProvider(create: (context) => BillMasterCubit()),

        // Whatsapp
        BlocProvider(create: (context) => WhatsappSessionCubit()),

        // Online Shop
        BlocProvider(create: (context) => ShopOrderMasterCubit()),

        // Package Plan
        BlocProvider(create: (context) => PackageMasterCubit()),
        BlocProvider(create: (context) => PackageDetailCubit()),
        BlocProvider(create: (context) => PurchaseCubit()),
        BlocProvider(create: (context) => PurchaseCubit()),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          title: "Point of Sales",
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkTheme,
          themeMode: ThemeMode.light,
          navigatorKey: navigatorKey,
          navigatorObservers: [CustomNavigatorObserver()],
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
            "/otp-input": (context) => OtpInputScreen(
                  arguments: ModalRoute.of(context)!.settings.arguments
                      as OtpInputArgument,
                ),
            "/completing-data": (context) => CompletingDataScreen(
                  arguments: ModalRoute.of(context)!.settings.arguments
                      as CompletingDataArgument,
                ),
            "/cashier": (context) => const DashboardScreen(),
            "/cashier/open-cashier-pin": (context) =>
                const OpenCashierPinScreen(),
            "/cashier/transaction-date": (context) =>
                const TransactionDateScreen(),
            "/cashier/explore-products": (context) =>
                const ExploreProductScreen(),
            "/cashier/onboarding-transaction": (context) =>
                const OnboardingTransactionScreen(),
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
            "/orders/detail": (context) => OrderDetailScreen(
                  arguments: ModalRoute.of(context)!.settings.arguments
                      as OrderDetailArgument,
                ),
            "/orders/add-item": (context) => OrderAddItemScreen(
                  arguments: ModalRoute.of(context)!.settings.arguments
                      as OrderAddItemArgument,
                ),
            "/orders/proof": (context) => const PreviewProofTransfer(),

            // payments
            "/payments/qris": (context) => const QrisPaymentScreen(),
            "/payments/bank_transfer": (context) => BankTransferPaymentScreen(
                  arguments: ModalRoute.of(context)!.settings.arguments
                      as BankTransferPaymentArgument,
                ),
            "/payments/success_confirmation": (context) =>
                SuccessConfirmationPaymentScreen(
                  arguments: ModalRoute.of(context)!.settings.arguments
                      as SuccessConfirmationPaymentArgument,
                ),

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

            // print
            "/print": (context) => const PrintMasterScreen(),

            // employee
            "/employee": (context) => const MasterEmployeScreen(),
            "/employee/new": (context) => const NewEmployeeScreen(),
            "/employee/detail": (context) => DetailEmployeeScreen(
                  arguments: ModalRoute.of(context)!.settings.arguments
                      as EmployeeDetailArgument,
                ),
            "/employee/edit": (context) => EmployeeEditScreen(
                  arguments: ModalRoute.of(context)!.settings.arguments
                      as EmployeeEditArgument,
                ),

            // bank accounts
            "/bank_accounts": (context) => const BankAccountMasterScreen(),
            "/bank_accounts/new": (context) => const BankAccountNewScreen(),
            "/bank_accounts/detail": (context) => BankAccountDetailScreen(
                  arguments: ModalRoute.of(context)!.settings.arguments
                      as BankAccountDetailArgument,
                ),

            // taxes
            "/taxes": (context) => const TaxMasterScreen(),

            // charges
            "/charges": (context) => const ChargeMasterScreen(),

            // Profile & Account
            "/account": (context) => const AccountMasterScreen(),
            "/account/edit": (context) => const AccountEditScreen(),
            "/account/edit/name": (context) => const NameEditScreen(),
            "/account/edit/phone_number": (context) =>
                const PhoneNumberEditScreen(),
            "/account/edit/email": (context) => const EmailEditScreen(),
            "/account/edit/pin": (context) => const PinEditScreen(),

            // reports
            "/reports": (context) => const ReportMasterScreen(),
            "/reports/best_seller": (context) => const ReportBestSellerScreen(),
            "/reports/best_seller/detail": (context) =>
                ReportProductSalesScreen(
                  arguments: ModalRoute.of(context)!.settings.arguments
                      as ReportProductSalesArguments,
                ),

            // Notifications
            "/notifications": (context) => const NotificationMasterScreen(),

            // Manage Account
            "/manage_account": (context) => const ManageAccountScreen(),
            "/delete_account": (context) => const DeleteAccountScreen(),
            "/delete_account/reason": (context) =>
                const DeleteAccountReasonScreen(),

            // Package
            "/packages": (context) => const PackageMasterScreen(),
            "/packages/grow": (context) => const PackageDetailScreen(),
            "/boost": (context) => const BoostDetailScreen(),

            // Checkout
            "/checkout": (context) => const ChekcoutMasterScreen(),
            "/payment/confirmation": (context) =>
                const PaymentConfirmationScreen(),
            "/payment/prepared": (context) => const PaymentPreparedScreen(),
            "/payment/success": (context) => const PaymentSuccessScreen(),

            //Webview
            "/terms_conditions": (context) => const TermsConditionScreen(),
            "/privacy_policy": (context) => const PrivacyPolicyScreen(),

            // AI Chatbot
            "/ai_chatbot": (context) => const AIChatbotMasterScreen(),

            // Online Store
            "/online_shop": (context) => const OnlineShopMasterScreen(),
            "/online_shop/customer_service": (context) =>
                const OnlineShopCsMaster(),
            "/online_shop/ai_configuration": (context) =>
                const OnlineShopAIConfigScreen(),
            "/online_shop/ai_configuration/description": (context) =>
                const OnlineShopAIDescriptionScreen(),
            "/online_shop/ai_configuration/language_style": (context) =>
                const OnlineShopAILanguageStyleScreen(),
            "/online_shop/ai_configuration/sop": (context) =>
                const OnlineShopAISOPScreen(),
            "/online_shop/ai_configuration/sop/new": (context) =>
                OnlineShopAISOPNewScreen(
                  arguments: ModalRoute.of(context)!.settings.arguments
                      as OnlineShopAISopNewArgument,
                ),
            "/online_shop/ai_configuration/glossary": (context) =>
                const OnlineShopAIGlossaryScreen(),
            "/online_shop/ai_configuration/faq": (context) =>
                const OnlineShopAIFAQScreen(),
            "/online_shop/orders": (context) =>
                const OnlineShopOrderMasterScreen(),
            "/online_shop/orders/detail": (context) =>
                OnlineShopOrderDetailScreen(
                  arguments: ModalRoute.of(context)!.settings.arguments
                      as OnlineShopOrderDetailArgument,
                ),
            "/online_shop/orders/detail/track": (context) =>
                OnlineShopOrderTrackScreen(
                  arguments: ModalRoute.of(context)!.settings.arguments
                      as OnlineShopOrderTrackArgument,
                ),
          },
        ),
      ),
    );
  }
}

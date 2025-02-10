import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/loading_screen.dart';
import 'package:lakoe_pos/features/checkout/data/arguments/purchase_argument.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:lakoe_pos/features/checkout/application/purchase_cubit.dart';
import 'package:lakoe_pos/features/checkout/application/purchase_state.dart';
import 'package:lakoe_pos/features/checkout/data/payment_method_model.dart';
import 'package:lakoe_pos/utils/helpers/helper.dart';

class PaymentPreparedScreen extends StatefulWidget {
  const PaymentPreparedScreen({super.key});

  @override
  State<PaymentPreparedScreen> createState() => _PaymentPreparedScreenState();
}

class _PaymentPreparedScreenState extends State<PaymentPreparedScreen> {
  Map<String, dynamic>? args;

  PaymentCategory? selectedCategory;
  PaymentMethodCheckout? selectedMethod;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      if (args != null) {
        final package = args!['package'];
        selectedMethod = args!['selectedMethod'] as PaymentMethodCheckout?;
        selectedCategory = args!['selectedCategory'] as PaymentCategory?;

        final baseUrl = "lakoe://package/payment";

        if (selectedMethod != null) {
          final successReturnUrl =
              "$baseUrl?status=success&package=${package.name}";
          final failedReturnUrl =
              "$baseUrl?status=failed&package=${package.name}";

          context.read<PurchaseCubit>().create(
                dto: PurchaseDto(
                  period: package.period,
                  paymentMethod: selectedMethod!.name.toUpperCase(),
                  successReturnUrl: successReturnUrl,
                  failedReturnUrl: failedReturnUrl,
                ),
                packageName: package.name,
              );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PurchaseCubit, PurchaseState>(
      listener: (context, state) async {
        if (state is PurchaseActionInProgress) {
        } else if (state is PurchaseActionFailure) {
          if (state.error.contains("400")) {
            CustomToast.show(
              "Opps, terjadi kesalahan. Coba lagi nanti.",
              duration: 10,
              position: "bottom",
              backgroundColor: TColors.error,
            );
            Future.delayed(const Duration(seconds: 4), () {
              if (!context.mounted) return;
              Navigator.pop(context);
            });
          } else {
            CustomToast.show(state.error, duration: 10);
          }
        } else if (state is PurchaseActionSuccess) {
          final PurchaseDetail res = state.res;

          if (res.paymentRequest.paymentMethod.type == "EWALLET") {
            ActionPayment selectedAction;

            selectedAction = res.paymentRequest.actions.firstWhere(
              (action) => action.urlType == "DEEPLINK",
              orElse: () => res.paymentRequest.actions.firstWhere(
                (action) => action.urlType == "MOBILE",
                orElse: () => res.paymentRequest.actions.firstWhere(
                  (action) => action.urlType == "WEB",
                  orElse: () => res.paymentRequest.actions.firstWhere(
                    (action) => action.qrCode != null,
                    orElse: () => ActionPayment(
                      action: null,
                      urlType: null,
                      method: null,
                      url: null,
                      qrCode: null,
                    ),
                  ),
                ),
              ),
            );

            if (selectedAction.url != null) {
              await THelper.openUrl(selectedAction.url!);

              if (!context.mounted) return;
              Navigator.pushNamed(
                context,
                "/payment/waiting",
                arguments: PurchaseArgument(
                  selectedMethod: selectedMethod!,
                  selectedCategory: selectedCategory!,
                  purchases: PurchaseDetail(
                    paymentRequest: state.res.paymentRequest,
                    purchase: state.res.purchase,
                  ),
                ),
              );
            }
          } else if (res.paymentRequest.paymentMethod.type ==
              "VIRTUAL_ACCOUNT") {
            Navigator.pushNamed(
              context,
              "/payment/waiting",
              arguments: PurchaseArgument(
                selectedMethod: selectedMethod!,
                selectedCategory: selectedCategory!,
                purchases: PurchaseDetail(
                  paymentRequest: state.res.paymentRequest,
                  purchase: state.res.purchase,
                ),
              ),
            );
          }
        }
      },
      child: PopScope(
        onPopInvokedWithResult: (popDisposition, popResult) async {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/home",
                (route) => false,
              );
            }
          });
          return Future.value(null);
        },
        child: LoadingScreen(),
      ),
    );
  }
}

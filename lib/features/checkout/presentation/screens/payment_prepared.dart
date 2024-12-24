import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/ui/loading_screen.dart';
import 'package:package_repository/package_repository.dart';
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
  PaymentMethod? selectedMethod;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      if (args != null) {
        final package = args!['package'];
        selectedMethod = args!['selectedMethod'] as PaymentMethod?;
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
      listener: (context, state) {
        if (state is PurchaseActionInProgress) {
        } else if (state is PurchaseActionSuccess) {
          final PurchaseResponseModel res = state.res;

          if (res.paymentRequest.paymentMethod.type == "EWALLET") {
            PaymentActionModel selectedAction;

            // This code block is responsible for selecting a payment action based on a priority of URL types.
            // It attempts to find an action with a specific `urlType` in the following order of preference:
            // "DEEPLINK", "MOBILE", "WEB". If none of these types are found, it checks for an action with a `qrCode`.

            selectedAction = res.paymentRequest.actions.firstWhere(
              (action) => action.urlType == "DEEPLINK",
              orElse: () => res.paymentRequest.actions.firstWhere(
                (action) => action.urlType == "MOBILE",
                orElse: () => res.paymentRequest.actions.firstWhere(
                  (action) => action.urlType == "WEB",
                  orElse: () => res.paymentRequest.actions.firstWhere(
                    (action) => action.qrCode != null,
                    // If no matching action is found, it returns a default PaymentActionModel with null values.
                    orElse: () => PaymentActionModel(
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
              THelper.openUrl(selectedAction.url!);
            } else if (selectedAction.qrCode != null) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("QR Code Ditemukan"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("QR Code: ${selectedAction.qrCode}"),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("OK"),
                      ),
                    ],
                  );
                },
              );
            }
          } else if (res.paymentRequest.paymentMethod.type ==
              "VIRTUAL_ACCOUNT") {
            Navigator.pushNamed(
              context,
              "/payment/confirmation",
              arguments: {
                'selectedMethod': selectedMethod,
                'selectedCategory': selectedCategory,
                'purchases': PurchaseResponseModel(
                  paymentRequest: state.res.paymentRequest,
                  purchase: state.res.purchase,
                ),
              },
            );
          }
        }
      },
      child: LoadingScreen(),
    );
  }
}

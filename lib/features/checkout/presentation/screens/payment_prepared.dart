import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_repository/package_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/features/checkout/application/purchase_cubit.dart';
import 'package:point_of_sales_cashier/features/checkout/application/purchase_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/helpers/helper.dart';
import 'package:uni_links/uni_links.dart';

class PaymentPreparedScreen extends StatefulWidget {
  const PaymentPreparedScreen({super.key});

  @override
  State<PaymentPreparedScreen> createState() => _PaymentPreparedScreenState();
}

class _PaymentPreparedScreenState extends State<PaymentPreparedScreen> {
  Map<String, dynamic>? args;
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();

    handleDeeplink();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      if (args != null) {
        final package = args?['package'];
        final selectedCategory = args?['selectedCategory'];
        final selectedMethod = args?['selectedMethod'];

        if (selectedMethod != null && selectedCategory != null) {
          context.read<PurchaseCubit>().create(
                dto: PurchaseDto(
                  period: package!.period,
                  paymentMethod: selectedMethod!.name.toUpperCase(),
                ),
                packageName: package!.name,
              );
        }
      }
    });
  }

  void handleDeeplink() {
    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null &&
          uri.scheme == 'lakoe' &&
          uri.host == 'payment' &&
          uri.path == '/success') {
        Navigator.pushNamed(context, "/payment/success");
      }
    }, onError: (err) {
      // Error handling
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PurchaseCubit, PurchaseState>(
      listener: (context, state) {
        if (state is PurchaseActionInProgress) {
        } else if (state is PurchaseActionSuccess) {
          final PurchaseResponseModel response = state.response;

          if (response.paymentRequest.paymentMethod.type == "EWALLET") {
            PaymentActionModel selectedAction;

            selectedAction = response.paymentRequest.actions.firstWhere(
              (action) => action.urlType == "DEEPLINK",
              orElse: () => response.paymentRequest.actions.firstWhere(
                (action) => action.urlType == "MOBILE",
                orElse: () => response.paymentRequest.actions.firstWhere(
                  (action) => action.urlType == "WEB",
                  orElse: () => response.paymentRequest.actions.firstWhere(
                    (action) => action.qrCode != null,
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
          }
        }
      },
      child: Scaffold(
        body: Container(
          color: TColors.neutralLightLightest,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: LinearProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(TColors.primary),
                        backgroundColor: TColors.neutralLightMedium,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextBodyL(
                    "Tunggu sebantar, ya!",
                    color: TColors.neutralDarkLight,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

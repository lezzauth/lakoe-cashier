import 'dart:async';
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:point_of_sales_cashier/common/widgets/error_display/error_display.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:token_provider/token_provider.dart';

class RedirectScreen extends StatefulWidget {
  const RedirectScreen({super.key});

  @override
  State<RedirectScreen> createState() => _RedirectScreenState();
}

class _RedirectScreenState extends State<RedirectScreen> {
  bool isBottomSheetVisible = false;
  late final StreamSubscription<List<ConnectivityResult>>
      _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().initialize();

    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.none) {
        if (!mounted) return;
        context.read<AuthCubit>().initialize();
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> openWifiSettings() async {
    final intent = AndroidIntent(
      action: 'android.settings.WIFI_SETTINGS',
      flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
    );
    await intent.launch();
  }

  Future<void> openMobileDataSettings() async {
    final intent = AndroidIntent(
      action: 'android.settings.DATA_ROAMING_SETTINGS',
      flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
    );
    await intent.launch();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (!mounted) return;

        final TokenProvider tokenProvider = TokenProvider();
        final token = await tokenProvider.getAuthToken();

        if (!mounted) return;

        if (token == null || token.isEmpty) {
          Navigator.popAndPushNamed(context, "/on-boarding");
          return;
        }

        if (state is AuthNotReady && !isBottomSheetVisible) {
          isBottomSheetVisible = true;
          if (!mounted) return;

          showModalBottomSheet(
            context: context,
            enableDrag: false,
            isDismissible: false,
            builder: (context) {
              return CustomBottomsheet(
                hasGrabber: false,
                child: ErrorDisplay(
                  imageSrc: TImages.noConnection,
                  title: "Yah, internetnya mati…",
                  description:
                      "Coba cek WiFi atau kuota internet kamu dan nanti coba lagi ya.",
                  actionTitlePrimary: "Pengaturan",
                  onActionPrimary: () {
                    openWifiSettings();
                    Navigator.pop(context);
                    isBottomSheetVisible = false;
                  },
                  actionTitleSecondary: "Coba Lagi",
                  onActionSecondary: () {
                    context.read<AuthCubit>().initialize();
                    Navigator.pop(context);
                    isBottomSheetVisible = false;
                  },
                ),
              );
            },
          );
          return;
        }

        if (state is AuthReady) {
          Navigator.popAndPushNamed(context, "/cashier");
        } else if (state is UncompletedProfile ||
            (state is TokenExpired && state.res.code == 401) ||
            (state is NotFound && state.res.code == 404)) {
          await tokenProvider.clearAll();
          Navigator.popAndPushNamed(context, "/on-boarding");
        }
      },
      child: BlocListener<CashierCubit, CashierState>(
        listener: (context, state) {},
        child: Scaffold(
          body: Container(
            color: TColors.neutralLightLightest,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      TImages.primaryLogoLakoe,
                      height: 40,
                    ),
                    SizedBox(height: 32),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

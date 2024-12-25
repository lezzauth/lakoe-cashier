import 'dart:async';
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:app_data_provider/app_data_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/utils/helpers/deeplink_handler.dart';
import 'package:logman/logman.dart';
import 'package:lakoe_pos/common/widgets/error_display/error_display.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:token_provider/token_provider.dart';

class RedirectScreen extends StatefulWidget {
  const RedirectScreen({super.key});

  @override
  State<RedirectScreen> createState() => _RedirectScreenState();
}

class _RedirectScreenState extends State<RedirectScreen> {
  bool navigated = false;
  bool isBottomSheetVisible = false;

  final DeeplinkHandler _deeplinkHandler = DeeplinkHandler();

  late final StreamSubscription<List<ConnectivityResult>>
      connectivitySubscription;

  Future<void> loadFlavor() async {
    final AppDataProvider appDataProvider = AppDataProvider();
    final flavor = await appDataProvider.flavor;

    if (flavor == "dev") {
      Logman.instance.info('App started!');

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Logman.instance.attachOverlay(
          context: context,
          button: FloatingActionButton.small(
            key: Key('logman-button'),
            onPressed: () {},
            child: Icon(Icons.terminal),
          ),
          printLogs: true,
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadFlavor();
    init();
    _deeplinkHandler.init(
      onDeeplinkReceived: _handleDeeplink,
      onError: () {
        Logman.instance.error("[Redirect] Failed to handle deeplink.");
      },
    );
  }

  @override
  void dispose() {
    connectivitySubscription.cancel();
    _deeplinkHandler.dispose();
    super.dispose();
  }

  void _handleDeeplink(Uri uri) {
    if (navigated) {
      Logman.instance.info(
          "[Redirect] Deeplink navigation already performed, skipping...");
      return;
    }

    Logman.instance.info("[Redirect] Handling deeplink: $uri");
    final path = uri.path;
    final status = uri.queryParameters['status'];
    final package = uri.queryParameters['package'];

    if (path == "/payment" && status != null && package != null) {
      _deeplinkHandler.dispose();
      navigated = true;

      if (status == "success") {
        Navigator.pushNamed(
          context,
          "/payment/success",
          arguments: {'packageName': package.toUpperCase()},
        );
      } else if (status == "failed") {
        Navigator.pushNamed(
          context,
          "/payment/failed",
          arguments: {'packageName': package.toUpperCase()},
        );
      } else {
        Logman.instance.error("[Redirect] Invalid status value: $status");
      }
    } else {
      Logman.instance
          .error("[Redirect] Invalid path or missing parameters in deeplink.");
    }
  }

  void init() {
    context.read<AuthCubit>().initialize();

    connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.none) {
        if (!mounted) return;
        if (isBottomSheetVisible) {
          Navigator.pop(context);
          isBottomSheetVisible = false;

          CustomToast.show(
            "Internet terhubung kembali",
            backgroundColor: TColors.success,
          );
        }

        context.read<AuthCubit>().initialize();
      }
    });
  }

  Future<void> openSettings() async {
    final intent = AndroidIntent(
      action: 'android.settings.SETTINGS',
      flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
    );
    await intent.launch();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        Logman.instance.info('[Redirect] AuthState is $state');
        if (!mounted) return;

        final TokenProvider tokenProvider = TokenProvider();
        final token = await tokenProvider.getAuthToken();

        if (state is AuthLoadInProgress) {
          Logman.instance
              .info('AuthState is in progress, waiting for result...');
          return;
        }

        if (!navigated && (token == null || token.isEmpty)) {
          Logman.instance.info("[Redirect] Token is Empty");
          navigated = true;
          Navigator.popAndPushNamed(context, "/on-boarding");
          return;
        }

        if (state is ConnectionIssue && !isBottomSheetVisible) {
          isBottomSheetVisible = true;

          if (!mounted) return;

          await showModalBottomSheet(
            context: context,
            enableDrag: false,
            isDismissible: false,
            builder: (context) {
              return PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) async {},
                child: CustomBottomsheet(
                  hasGrabber: false,
                  child: ErrorDisplay(
                    imageSrc: TImages.noConnection,
                    title: "Koneksi internet aman ngga?",
                    description:
                        "Coba cek WiFi atau kuota internet kamu dulu terus bisa dicoba lagi, ya!",
                    actionTitlePrimary: "Pengaturan",
                    onActionPrimary: () {
                      isBottomSheetVisible = false;
                      Navigator.pop(context);
                      openSettings();
                    },
                    actionTitleSecondary: "Coba Lagi",
                    onActionSecondary: () async {
                      isBottomSheetVisible = false;
                      Navigator.pop(context);
                      await Future.delayed(Duration(seconds: 2));
                      init();
                    },
                  ),
                ),
              );
            },
          ).whenComplete(() {
            isBottomSheetVisible = false;
          });
          return;
        }

        if (!navigated) {
          if (state is AuthReady) {
            final currentRoute = ModalRoute.of(context)?.settings.name;

            // Hindari navigasi ulang jika navigasi sudah dilakukan oleh deeplink
            if (currentRoute == "/payment/success" ||
                currentRoute == "/payment/failed") {
              Logman.instance.info(
                  "[Redirect] Skipping navigation, deeplink already handled.");
              return;
            }

            // Navigasi ke cashier jika tidak ada deeplink
            if (currentRoute != "/home") {
              Logman.instance.info("[Redirect] Navigating to /cashier");
              navigated = true;
              Navigator.popAndPushNamed(context, "/home");
            } else {
              Logman.instance.info(
                  "[Redirect] Already on /cashier, no navigation needed.");
            }
          } else if ((state is AuthNotReady) ||
              (state is TokenExpired &&
                  state.res.statusCode == 401 &&
                  !state.isTokenRefreshed) ||
              (state is NotFound && state.res.statusCode == 404)) {
            Logman.instance.info("[Redirect] Navigating to /on-boarding");
            navigated = true;
            Navigator.popAndPushNamed(context, "/on-boarding");
          }
        } else {
          Logman.instance
              .info("[Redirect] Navigation already performed, skipping...");
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

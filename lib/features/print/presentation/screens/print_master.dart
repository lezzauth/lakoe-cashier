import 'dart:async';
import 'package:app_data_provider/app_data_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/error_display/error_display.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:lakoe_pos/features/bill/application/cubit/bill_master/bill_master_cubit.dart';
import 'package:lakoe_pos/features/print/application/cubit/print_master/print_master_cubit.dart';
import 'package:lakoe_pos/features/print/application/cubit/print_master/print_master_state.dart';
import 'package:lakoe_pos/features/print/common/helpers/animated_dots_text.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:lakoe_pos/utils/print/bill.dart';

class PrintMasterScreen extends StatefulWidget {
  const PrintMasterScreen({super.key});

  @override
  State<PrintMasterScreen> createState() => _PrintMasterScreenState();
}

class _PrintMasterScreenState extends State<PrintMasterScreen> {
  final AppDataProvider _appDataProvider = AppDataProvider();

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  void _onInit() {
    context.read<PrintMasterCubit>().init().then((_) {
      if (!mounted) return;
      context.read<PrintMasterCubit>().discoverDevices();
    });
  }

  Future<void> _onRefresh() async {
    context.read<PrintMasterCubit>().discoverDevices();
  }

  Future<void> _onConnectToDevice(BluetoothDevice device) async {
    await context.read<PrintMasterCubit>().connectToDevice(device);
  }

  Future<void> _onUnpairDevice(BluetoothDevice device) async {
    await context.read<PrintMasterCubit>().unpairDevice(device);
  }

  Future<void> _onDisconnectDevice(BluetoothDevice device) async {
    await context.read<PrintMasterCubit>().disconnectDevice(device);
  }

  @override
  void dispose() {
    context.read<PrintMasterCubit>().stopDiscovery();
    super.dispose();
  }

  void _showBluetoothDisabledBottomSheet() {
    showModalBottomSheet(
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
              imageSrc: TImages.bluetoothPermission,
              title: "Izin akses bluetooth HP kamu, ya",
              description:
                  "Dengan ini, kamu akan bisa menggunakan fitur aplikasi yang membutuhkan bluetooth.",
              actionTitlePrimary: "Aktifkan Bluetooth",
              onActionPrimary: () async {
                Navigator.pop(context);
                bool? isEnabled =
                    await FlutterBluetoothSerial.instance.requestEnable();
                if (isEnabled == true) {
                  _onRefresh();
                }
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Print & Struk (Bill)",
      ),
      body: BlocConsumer<PrintMasterCubit, PrintMasterState>(
        listener: (context, state) {
          if (state is PrintMasterBluetoothDisabled) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showBluetoothDisabledBottomSheet();
            });
          }
        },
        builder: (context, state) {
          if (state is PrintMasterLoadSuccess ||
              state is PrintMasterLoadInProgress) {
            final devices =
                state is PrintMasterLoadSuccess ? state.devices : [];
            final connectedDevices =
                state is PrintMasterLoadSuccess ? state.connectedDevices : [];
            final availableDevices =
                state is PrintMasterLoadSuccess ? state.availableDevices : [];
            final connectingDevices =
                state is PrintMasterLoadSuccess ? state.connectingDevices : [];
            final pairingDevices =
                state is PrintMasterLoadSuccess ? state.pairingDevices : [];
            final disconnectingDevices = state is PrintMasterLoadSuccess
                ? state.disconnectingDevices
                : [];
            final isDiscovering =
                state is PrintMasterLoadSuccess && state.isDiscovering;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: TColors.neutralLightLightest,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        width: 1,
                        color: TColors.neutralLightMedium,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: const TextHeading4(
                                  "Print Otomatis",
                                  color: TColors.neutralDarkDarkest,
                                ),
                              ),
                              const TextBodyS(
                                "Setiap kali transaksi selesai (lunas) secara otomatis akan melakukan print struk.",
                                color: TColors.neutralDarkLight,
                              ),
                            ],
                          ),
                        ),
                        FutureBuilder<bool?>(
                          future: _appDataProvider.isAutoPrint,
                          builder: (context, snapshot) {
                            return FormBuilderField<bool>(
                              name: "isServiceChargeActive",
                              builder: (FormFieldState<bool> field) {
                                return FittedBox(
                                  fit: BoxFit.cover,
                                  child: Switch(
                                    value: field.value ?? snapshot.data!,
                                    onChanged: (value) async {
                                      field.didChange(value);
                                      await _appDataProvider
                                          .setIsBillAutoPrint(value);
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                if (devices.isNotEmpty ||
                    connectedDevices.isNotEmpty ||
                    availableDevices.isNotEmpty)
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      children: [
                        if (connectedDevices.isNotEmpty) ...[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              padding: const EdgeInsets.only(top: 20),
                              margin: const EdgeInsets.only(bottom: 8),
                              child: const TextHeading5(
                                "TERSAMBUNG",
                                color: TColors.neutralDarkLightest,
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: connectedDevices.length,
                            itemBuilder: (context, index) {
                              BluetoothDevice device =
                                  connectedDevices.elementAt(index);
                              return BluetoothDeviceTile(
                                device: device,
                                isConnected: true,
                                isDisconnecting: disconnectingDevices
                                    .contains(device.address),
                                onConnectPressed: () {
                                  _onDisconnectDevice(device);
                                },
                              );
                            },
                          ),
                        ],
                        if (devices.isNotEmpty) ...[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              padding: const EdgeInsets.only(top: 20),
                              margin: const EdgeInsets.only(bottom: 8),
                              child: const TextHeading5(
                                "PERNAH TERSAMBUNG",
                                color: TColors.neutralDarkLightest,
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: devices.length,
                            itemBuilder: (context, index) {
                              BluetoothDevice device = devices.elementAt(index);
                              return GestureDetector(
                                onLongPress: () {
                                  _onUnpairDevice(device);
                                },
                                child: BluetoothDeviceTile(
                                  device: device,
                                  isConnected: false,
                                  isPaired: true,
                                  isPairing:
                                      pairingDevices.contains(device.address),
                                  isConnecting: connectingDevices
                                      .contains(device.address),
                                  onConnectPressed: () {
                                    _onConnectToDevice(device);
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                        if (availableDevices.isNotEmpty) ...[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              padding: const EdgeInsets.only(top: 20),
                              margin: const EdgeInsets.only(bottom: 8),
                              child: const TextHeading5(
                                "PERANGKAT TERSEDIA",
                                color: TColors.neutralDarkLightest,
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: availableDevices.length,
                            itemBuilder: (context, index) {
                              BluetoothDevice device =
                                  availableDevices.elementAt(index);
                              return BluetoothDeviceTile(
                                device: device,
                                isConnected: false,
                                isConnecting:
                                    connectingDevices.contains(device.address),
                                onConnectPressed: () {
                                  _onConnectToDevice(device);
                                },
                              );
                            },
                          ),
                        ],
                        const SizedBox(height: 12),
                        if (!isDiscovering)
                          Center(
                            child: TextButton(
                              onPressed: _onRefresh,
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  UiIcons(
                                    TIcons.refresh,
                                    size: 24,
                                    color: TColors.primary,
                                  ),
                                  SizedBox(width: 8),
                                  TextActionL(
                                    "Refresh",
                                    color: TColors.primary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (isDiscovering)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Center(
                              child: SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                if (connectedDevices.isEmpty &&
                    devices.isEmpty &&
                    availableDevices.isEmpty)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: EmptyList(
                        image: SvgPicture.asset(
                          !isDiscovering
                              ? TImages.noPrintIllustrationSvg
                              : TImages.scanPrintIllustrationSvg,
                          width: 140,
                          height: 101.45,
                          fit: BoxFit.cover,
                        ),
                        title: !isDiscovering
                            ? "Perangkat tidak ditemukan"
                            : "Mencari perangkat…",
                        subTitle: !isDiscovering
                            ? "Silahkan klik refresh untuk dapat menemukan printer di sekitarmu."
                            : "",
                        action: SizedBox(
                          width: 140,
                          child: TextButton(
                            onPressed: _onRefresh,
                            child: Stack(
                              children: [
                                if (!isDiscovering)
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const UiIcons(
                                        TIcons.refresh,
                                        size: 24,
                                        color: TColors.primary,
                                      ),
                                      const SizedBox(width: 8),
                                      TextActionL(
                                        "Refresh",
                                        color: TColors.primary,
                                      ),
                                    ],
                                  ),
                                if (isDiscovering)
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Center(
                                      child: SizedBox(
                                        height: 16,
                                        width: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.0,
                                        ),
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: BillAction(
                    onTestPrint: connectedDevices.isEmpty
                        ? null
                        : () {
                            final billMasterState =
                                context.read<BillMasterCubit>().state;

                            String footNote = "";
                            footNote = billMasterState.footNote;

                            final authState = context.read<AuthCubit>().state;

                            OwnerProfileModel profile;
                            if (authState is AuthReady) {
                              profile = authState.profile;
                            } else {
                              profile = OwnerProfileModel(
                                id: '',
                                name: '',
                                phoneNumber: '',
                                packageName: '',
                                outlets: [],
                              );
                              if (kDebugMode) {
                                print(
                                    'AuthState is not ready, using default profile.');
                              }
                            }

                            TBill.testPrint(context, profile, footNote);
                          },
                    onShowBill: () {
                      Navigator.pushNamed(context, "/bill");
                    },
                  ),
                ),
              ],
            );
          } else if (state is PrintMasterLoadFailure) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: EmptyList(
                  image: SvgPicture.asset(
                    TImages.noPrintIllustrationSvg,
                    width: 140,
                    height: 101.45,
                    fit: BoxFit.cover,
                  ),
                  title: "Perangkat tidak ditemukan",
                  subTitle:
                      "Silahkan klik refresh untuk dapat menemukan printer di sekitarmu.",
                  action: TextButton(
                    onPressed: _onRefresh,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        UiIcons(
                          TIcons.refresh,
                          size: 24,
                          color: TColors.primary,
                        ),
                        SizedBox(width: 8),
                        TextActionL(
                          "Refresh",
                          color: TColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class BluetoothDeviceTile extends StatelessWidget {
  const BluetoothDeviceTile({
    super.key,
    required this.device,
    required this.isConnected,
    this.isPaired = false,
    required this.onConnectPressed,
    this.isPairing = false,
    this.isConnecting = false,
    this.isDisconnecting = false,
  });

  final BluetoothDevice device;
  final bool isConnected;
  final bool isPaired;
  final bool isPairing;
  final bool isConnecting;
  final bool isDisconnecting;
  final VoidCallback onConnectPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: !isConnecting ? onConnectPressed : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          leading: const CircleAvatar(
            radius: 20,
            backgroundColor: TColors.highlightLightest,
            child: UiIcons(
              TIcons.bluetooth,
              color: TColors.primary,
            ),
          ),
          title: TextHeading4(device.name ?? "Unnamed Device"),
          subtitle: (isConnecting || isDisconnecting || isPairing)
              ? AnimatedLoadingText(
                  isPairing
                      ? "Melepaskan perangkat"
                      : isConnecting
                          ? "Menyambungkan"
                          : 'Memutuskan',
                  style: TextStyle(
                    fontSize: TSizes.fontSizeBodyS,
                    color: TColors.neutralDarkLight,
                  ),
                )
              : TextBodyS(
                  device.address,
                  color: TColors.neutralDarkLight,
                ),
          trailing: TextButton(
            onPressed: !isConnecting && !isDisconnecting && !isPairing
                ? onConnectPressed
                : null,
            child: !isConnecting && !isDisconnecting && !isPairing
                ? TextActionM(
                    isConnected
                        ? 'Putuskan'
                        : isPaired
                            ? 'Sambungkan'
                            : '',
                    color: TColors.primary,
                  )
                : const SizedBox(
                    height: 12,
                    width: 12,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.8,
                    ),
                  ),
          ),
        ),
        const Divider(
          height: 1,
          indent: 16,
          color: TColors.neutralLightMedium,
        )
      ],
    );
  }
}

class BillAction extends StatelessWidget {
  final void Function()? onTestPrint;
  final void Function()? onShowBill;

  const BillAction({
    super.key,
    required this.onShowBill,
    required this.onTestPrint,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: onTestPrint,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                children: [
                  UiIcons(
                    TIcons.printer,
                    size: 20,
                    color: TColors.neutralLightLightest,
                    onTap: () {},
                  ),
                  const TextActionL(
                    "Tes Print",
                    color: TColors.neutralLightLightest,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 48,
            child: OutlinedButton(
              onPressed: onShowBill,
              child: const TextActionL(
                "Contoh Struk",
                color: TColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

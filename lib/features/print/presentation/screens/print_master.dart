import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/print/application/cubit/print_master/print_master_cubit.dart';
import 'package:point_of_sales_cashier/features/print/application/cubit/print_master/print_master_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/print/bill.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class PrintMasterScreen extends StatefulWidget {
  const PrintMasterScreen({super.key});

  @override
  State<PrintMasterScreen> createState() => _PrintMasterScreenState();
}

class _PrintMasterScreenState extends State<PrintMasterScreen> {
  void _onInit() {
    context.read<PrintMasterCubit>().init();
  }

  Future<void> _onRefresh() async {
    await context.read<PrintMasterCubit>().init();
  }

  Future<void> _onConnectToDevice(BluetoothInfo device) async {
    await context.read<PrintMasterCubit>().connectToDevice(device);
  }

  Future<void> _onDisconnectDevice(BluetoothInfo device) async {
    await context.read<PrintMasterCubit>().disconnectDevice(device);
  }

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(
          title: "Print & Struk (Bill)",
        ),
        body: BlocBuilder<PrintMasterCubit, PrintMasterState>(
          builder: (context, state) => switch (state) {
            PrintMasterLoadSuccess(
              :final devices,
              :final connectedDevices,
              :final connectingDevices
            ) =>
              Column(
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
                          FormBuilderField<bool>(
                            name: "isServiceChargeActive",
                            initialValue: false,
                            builder: (FormFieldState<bool> field) {
                              return SizedBox(
                                height: 28,
                                width: 45,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Switch(
                                    value: field.value ?? false,
                                    onChanged: (value) {
                                      field.didChange(value);
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (devices.isNotEmpty || connectedDevices.isNotEmpty)
                    Flexible(
                      child: ListView(
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
                                BluetoothInfo device =
                                    connectedDevices.elementAt(index);
                                return BluetoothDeviceTile(
                                  device: device,
                                  isConnected: true,
                                  onConnectPressed: () {
                                    _onDisconnectDevice(device);
                                  },
                                );
                              },
                            ),
                          ],
                          if (devices.isNotEmpty || connectedDevices.isNotEmpty)
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
                          if (devices.isNotEmpty) ...[
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: devices.length,
                              itemBuilder: (context, index) {
                                BluetoothInfo device = devices.elementAt(index);
                                return BluetoothDeviceTile(
                                  device: device,
                                  isConnected: false,
                                  isLoading: connectingDevices
                                      .contains(device.macAdress),
                                  onConnectPressed: () {
                                    _onConnectToDevice(device);
                                  },
                                );
                              },
                            ),
                          ],
                          const SizedBox(height: 12),
                          if (devices.isNotEmpty || connectedDevices.isNotEmpty)
                            TextButton(
                              onPressed: _onRefresh,
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  UiIcons(
                                    TIcons.refresh,
                                    width: 24,
                                    height: 24,
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
                        ],
                      ),
                    ),
                  if (connectedDevices.isEmpty && devices.isEmpty)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: EmptyList(
                          image: SvgPicture.asset(
                            TImages.noPrintIllustration,
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
                                  width: 24,
                                  height: 24,
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
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    child: BillAction(
                      onTestPrint: connectedDevices.isEmpty
                          ? null
                          : () {
                              TBill.testPrint();
                            },
                      onShowBill: () {
                        Navigator.pushNamed(context, "/bill");
                      },
                    ),
                  ),
                ],
              ),
            PrintMasterPermissionDenied() => const Center(
                child: TextBodyS("permission denied"),
              ),
            PrintMasterLoadFailure(:final error) => Center(
                child: TextBodyS(
                  error,
                  color: TColors.error,
                ),
              ),
            _ => const Center(
                child: CircularProgressIndicator(),
              ),
          },
        ));
  }
}

class BluetoothDeviceTile extends StatelessWidget {
  const BluetoothDeviceTile({
    super.key,
    required this.device,
    required this.isConnected,
    required this.onConnectPressed,
    this.isLoading = false,
  });

  final BluetoothInfo device;
  final bool isConnected;
  final bool isLoading;
  final VoidCallback onConnectPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: !isLoading ? onConnectPressed : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          leading: const CircleAvatar(
            radius: 20,
            backgroundColor: TColors.highlightLightest,
            child: UiIcons(
              TIcons.bluetooth,
              color: TColors.primary,
            ),
          ),
          title: TextHeading4(device.name),
          subtitle: TextBodyS(
            device.macAdress,
            color: TColors.neutralDarkLight,
          ),
          trailing: TextButton(
            onPressed: !isLoading ? onConnectPressed : null,
            child: !isLoading
                ? TextActionM(
                    isConnected ? 'Putuskan' : 'Sambungkan',
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
                    height: 20,
                    width: 20,
                    color: TColors.neutralLightLightest,
                    onTap: () {},
                  ),
                  const TextActionL(
                    "Test Print",
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

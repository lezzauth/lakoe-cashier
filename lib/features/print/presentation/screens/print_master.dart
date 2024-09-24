import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class PrintMasterScreen extends StatefulWidget {
  const PrintMasterScreen({super.key});

  @override
  State<PrintMasterScreen> createState() => _PrintMasterScreenState();
}

class _PrintMasterScreenState extends State<PrintMasterScreen> {
  List<BluetoothDevice> connectedDevices = [
    BluetoothDevice(id: "00:1A:7D:DA:71:13", name: "RPP02N"),
  ];
  List<BluetoothDevice> availableDevices = [
    BluetoothDevice(id: "B4:6D:83:3C:5B:6F", name: "Mi-TV"),
    BluetoothDevice(id: "18:93:D7:4F:B6:55", name: "HUAWEI WATCH FIT 3"),
    BluetoothDevice(id: "58:FB:84:A9:22:17", name: "Redmi Buds 5 Pro"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Print & Struk (Bill)",
      ),
      body: Column(
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
          Flexible(
            child: ListView(
              children: [
                // Bagian Perangkat Tersambung
                if (connectedDevices.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                      BluetoothDevice device = connectedDevices[index];
                      return BluetoothDeviceTile(
                        device: device,
                        isConnected: true,
                        onConnectPressed: () {},
                      );
                    },
                  ),
                ],
                // Bagian Perangkat Tersedia
                if (availableDevices.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                      BluetoothDevice device = availableDevices[index];
                      return BluetoothDeviceTile(
                        device: device,
                        isConnected: false,
                        onConnectPressed: () {},
                      );
                    },
                  ),
                ],
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {},
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
          if (connectedDevices.isEmpty && availableDevices.isEmpty)
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
                    onPressed: () {},
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
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: BillAction(
              onTestPrint: connectedDevices.isEmpty ? null : () {},
              onShowBill: () {
                Navigator.pushNamed(context, "/bill");
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BluetoothDeviceTile extends StatelessWidget {
  const BluetoothDeviceTile({
    super.key,
    required this.device,
    required this.isConnected,
    required this.onConnectPressed,
  });

  final BluetoothDevice device;
  final bool isConnected;
  final VoidCallback onConnectPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onConnectPressed,
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
            device.id,
            color: TColors.neutralDarkLight,
          ),
          trailing: TextButton(
            onPressed: () {},
            child: TextActionM(
              isConnected ? 'Putuskan' : 'Sambungkan',
              color: TColors.primary,
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

class BluetoothDevice {
  final String id;
  final String name;

  BluetoothDevice({
    required this.id,
    required this.name,
  });
}

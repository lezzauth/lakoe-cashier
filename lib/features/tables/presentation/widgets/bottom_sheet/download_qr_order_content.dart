import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/features/tables/presentation/widgets/tabs/table_qr_order_tab.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/device/device_uility.dart';

class DownloadQrOrderContent extends StatefulWidget {
  const DownloadQrOrderContent({super.key});

  @override
  State<DownloadQrOrderContent> createState() => _DownloadQrOrderContentState();
}

class _DownloadQrOrderContentState extends State<DownloadQrOrderContent> {
  String _selectedDownload = "current";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: TDeviceUtils.getViewInsets(context),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              child: const TextHeading2(
                "Download QR Order",
                color: TColors.neutralDarkDarkest,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: DownloadItemRadio(
                      title: "Hanya Meja Nomor T-01",
                      value: "current",
                      groupValue: _selectedDownload,
                      onChanged: (value) {
                        setState(() {
                          _selectedDownload = value!;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: DownloadItemRadio(
                      title: "Semua Nomor Meja",
                      value: "all",
                      groupValue: _selectedDownload,
                      onChanged: (value) {
                        setState(() {
                          _selectedDownload = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: TextActionL("Lanjutkan"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

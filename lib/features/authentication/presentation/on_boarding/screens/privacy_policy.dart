import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/webview/in_app_webiew.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Kebijakan Privasi",
      ),
      body: InAppWebViewScreen(
        url:
            "https://cumbersome-ravioli-912.notion.site/Kebijakan-Privasi-dan-Perlindungan-Data-Pribadi-9086d742c60b4097b4242c47eeb13d61",
      ),
    );
  }
}

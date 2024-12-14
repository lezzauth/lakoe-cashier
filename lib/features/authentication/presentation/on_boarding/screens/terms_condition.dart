import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/webview/in_app_webiew.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({super.key});

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Syarat & Ketentuan",
      ),
      body: InAppWebViewScreen(
        url:
            "https://cumbersome-ravioli-912.notion.site/Syarat-dan-Ketentuan-Penggunaan-Platform-Lakoe-907dfcec5484487cb784724025142c40",
      ),
    );
  }
}

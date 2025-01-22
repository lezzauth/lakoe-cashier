import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';

class AIChatbotCustomerServiceScreen extends StatefulWidget {
  const AIChatbotCustomerServiceScreen({super.key});

  @override
  State<AIChatbotCustomerServiceScreen> createState() =>
      _AIChatbotCustomerServiceScreenState();
}

class _AIChatbotCustomerServiceScreenState
    extends State<AIChatbotCustomerServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Tambah Customer Service",
      ),
    );
  }
}

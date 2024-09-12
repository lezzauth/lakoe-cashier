import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';

class BankAccountNewScreen extends StatefulWidget {
  const BankAccountNewScreen({super.key});

  @override
  State<BankAccountNewScreen> createState() => _BankAccountNewScreenState();
}

class _BankAccountNewScreenState extends State<BankAccountNewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Rekening Bank Baru",
      ),
    );
  }
}

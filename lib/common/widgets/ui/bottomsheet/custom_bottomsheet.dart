import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/grabber.dart';

class CustomBottomsheet extends StatelessWidget {
  const CustomBottomsheet({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Grabber(),
        child,
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class CartTabletDrawer extends StatefulWidget {
  const CartTabletDrawer({super.key});

  @override
  State<CartTabletDrawer> createState() => _CartTabletDrawerState();
}

class _CartTabletDrawerState extends State<CartTabletDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 1000,
      backgroundColor: TColors.error,
    );
  }
}

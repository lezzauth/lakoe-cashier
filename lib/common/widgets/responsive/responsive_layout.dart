import 'package:flutter/cupertino.dart';
import 'package:point_of_sales_cashier/utils/constants/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
  });

  final Widget mobile;
  final Widget tablet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < TDimensions.mobileWidth) {
          return mobile;
        }

        return tablet;
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    if (ResponsiveBreakpoints.of(context).smallerThan(TABLET) || isPortrait) {
      return mobile;
    }

    return tablet;
  }
}

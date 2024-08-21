import 'package:flutter/material.dart';

// class KeepAliveWrapper extends StatefulWidget {
//   final Widget child;

//   const KeepAliveWrapper({super.key, required this.child});

//   @override
//   __KeepAliveWrapperState createState() => __KeepAliveWrapperState();
// }

// class __KeepAliveWrapperState extends State<KeepAliveWrapper>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return widget.child;
//   }

//   @override
//   bool get wantKeepAlive => true;
// }

class KeepAliveWrapper extends StatefulWidget {
  final Widget child;
  const KeepAliveWrapper({super.key, required this.child});

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}

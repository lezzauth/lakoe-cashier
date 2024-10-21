import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedLoadingText extends StatefulWidget {
  final String text;
  final TextStyle? style;

  const AnimatedLoadingText(this.text, {Key? key, this.style})
      : super(key: key);

  @override
  _AnimatedLoadingTextState createState() => _AnimatedLoadingTextState();
}

class _AnimatedLoadingTextState extends State<AnimatedLoadingText> {
  int _dotCount = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        _dotCount = (_dotCount + 1) % 4;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String dots = '.' * _dotCount;
    return Text(
      '${widget.text}$dots',
      style: widget.style,
    );
  }
}

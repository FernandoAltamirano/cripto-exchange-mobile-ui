import 'dart:ui';

import 'package:flutter/material.dart';

class BgBlur extends StatelessWidget {
  const BgBlur(
      {Key? key,
      required this.child,
      this.width,
      this.borderColor = const Color.fromARGB(79, 62, 62, 74),
      this.borderRadius = 12,
      this.padding = 15.0})
      : super(key: key);
  final Widget child;
  final double? width;
  final Color borderColor;
  final double padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
            width: width ?? MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 1),
                color: Color.fromARGB(134, 11, 12, 20),
                borderRadius: BorderRadius.circular(borderRadius)),
            padding: EdgeInsets.all(padding),
            child: child),
      ),
    );
  }
}

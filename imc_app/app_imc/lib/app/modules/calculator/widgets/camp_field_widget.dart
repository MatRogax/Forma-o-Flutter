import 'package:flutter/material.dart';

class CampField extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Decoration? boxDecoration;
  const CampField({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.boxDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: boxDecoration,
      child: child,
    );
  }
}

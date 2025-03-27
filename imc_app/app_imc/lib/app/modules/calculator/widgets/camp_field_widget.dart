import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Size size;
  final Widget childCard;
  final Decoration decoration;
  const CardWidget({
    super.key,
    required this.childCard,
    required this.size,
    required this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: size.height * 0.04,
        width: size.width * 0.32,
        decoration: decoration,
        child: childCard,
      ),
    );
  }
}

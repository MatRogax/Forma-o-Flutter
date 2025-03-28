import 'package:flutter/material.dart';

class WidgetCalculatorField extends StatelessWidget {
  final Widget childWidget;
  final Size size;
  final String tittle;
  final double? width;
  final double? height;
  const WidgetCalculatorField({
    super.key,
    required this.tittle,
    required this.childWidget,
    required this.width,
    required this.height,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.025,
            bottom: size.height * 0.004,
          ),
          child: Text(
            tittle,
          ),
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ),
          ),
          child: childWidget,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class RulerBar extends StatelessWidget {
  final Size size;
  final Color color;
  final double barHorizontalPadding;
  final double barVerticalPadding;
  const RulerBar({
    Key? key,
    required this.size,
    required this.color,
    required this.barHorizontalPadding,
    required this.barVerticalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // x = y/5 - 1
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: barHorizontalPadding,
        vertical: barVerticalPadding,
      ),
      child: Container(
        color: color,
        width: size.width,
        height: size.height,
      ),
    );
  }
}

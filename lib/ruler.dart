import 'package:flutter/material.dart';

import 'mm_scale.dart';
import 'mv30.dart';

class Ruler extends StatelessWidget {
  final double width;
  final double height;
  final double barHorizontalPadding;
  final double barVerticalPadding;

  const Ruler({
    Key? key,
    this.width = 400,
    this.height = 150,
    required this.barHorizontalPadding,
    required this.barVerticalPadding,
  }) : super(key: key);
  Color get accentPastelBg => const Color.fromARGB(255, 247, 249, 250);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              border: Border.all(
                color: accentPastelBg,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            margin: const EdgeInsets.only(bottom: 4),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MMScale(
                      type: MMType.twentyFive,
                      barHorizontalPadding: barHorizontalPadding,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    MMScale(
                      type: MMType.fifty,
                      barHorizontalPadding: barHorizontalPadding,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: MV30(
                        barVerticalPadding: barVerticalPadding,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

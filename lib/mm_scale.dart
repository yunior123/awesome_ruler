import 'package:awesome_ruler/ruler_bar.dart';
import 'package:flutter/material.dart';

class MMScale extends StatelessWidget {
  final MMType type;
  final double barHorizontalPadding;
  const MMScale({
    Key? key,
    required this.type,
    required this.barHorizontalPadding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                _buildBeginning(
                  type == MMType.twentyFive ? "25 mm" : "50 mm",
                  barHorizontalPadding,
                ),
                _buildCore(),
                _buildEnding(),
              ],
            ),
          ),
          const SizedBox(
            width: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildBeginning(
    String label,
    final double barHorizontalPadding,
  ) {
    final beginningBars = <Widget>[];
    beginningBars.add(
      SizedBox(
        width: barHorizontalPadding,
      ),
    );
    for (var i = 0; i < 7; i++) {
      beginningBars.add(
        _getSmallVerticalBar(
          Colors.transparent,
          size: const Size(
            1,
            2,
          ),
        ),
      );
    }
    final row = Row(
      children: beginningBars,
    );
    final align = Align(
      alignment: type == MMType.twentyFive
          ? Alignment.bottomCenter
          : Alignment.topCenter,
      child: FittedBox(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.white,
          ),
        ),
      ),
    );

    if (type == MMType.twentyFive) {
      return Column(
        children: [
          row,
          align,
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        align,
        row,
      ],
    );
  }

  Widget _buildCore() {
    final coreBars = <Widget>[];
    for (var i = 0; i < 11; i++) {
      if (i == 0) {
        coreBars.add(_buildIntervalBox(i, invisibleTill: 2));
      } else if (i == 10) {
        coreBars.add(_buildIntervalBox(i, invisibleFrom: 2));
      } else {
        coreBars.add(_buildIntervalBox(i));
      }
    }
    return Row(
      children: coreBars,
    );
  }

  Widget _buildEnding() {
    final endBars = <Widget>[];
    for (var i = 0; i < 7; i++) {
      endBars.add(
        _getSmallVerticalBar(
          Colors.transparent,
        ),
      );
    }
    return Column(
      mainAxisAlignment: (type == MMType.twentyFive)
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        Row(
          children: endBars,
        ),
      ],
    );
  }

  Widget _buildIntervalBox(
    final int boxCount, {
    int invisibleTill = 0,
    int invisibleFrom = 5,
  }) {
    final factor = type == MMType.twentyFive ? 0.1 : 0.2;
    var label = (factor * boxCount).toStringAsFixed(1);
    if (boxCount == 0) {
      label = 0.toString();
    }
    final bars = <Widget>[];

    for (var i = 0; i < 5; i++) {
      final invisible = i < invisibleTill || i > invisibleFrom;
      if (i == 2) {
        bars.add(
          _getLargeVerticalBar(
            Colors.white,
          ),
        );
      } else {
        bars.add(
          _getSmallVerticalBar(
            invisible ? Colors.transparent : Colors.white,
          ),
        );
      }
    }
    if (type == MMType.twentyFive) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: bars,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FittedBox(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 8,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: FittedBox(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 8,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: bars,
        ),
      ],
    );
  }

  Widget _getLargeVerticalBar(
    Color color, {
    Size size = const Size(
      1,
      10,
    ),
  }) =>
      RulerBar(
        barVerticalPadding: 0,
        barHorizontalPadding: barHorizontalPadding,
        color: color,
        size: size,
      );

  Widget _getSmallVerticalBar(
    Color color, {
    Size size = const Size(
      1,
      8,
    ),
  }) =>
      Column(
        children: [
          RulerBar(
            barVerticalPadding: 0,
            barHorizontalPadding: barHorizontalPadding,
            color: color,
            size: size,
          ),
          Container(),
        ],
      );
}

enum MMType {
  twentyFive,
  fifty,
}

// Widget _buildLargeBar(
//   final int index,
// ) {
//   final label = (0.1 * index / 5).toStringAsFixed(1);
//   // final largeBarLocal = Stack(
//   //   children: [
//   //     largeBar,
//   //     const SizedBox(
//   //       height: 1,
//   //     ),
//   //     Positioned(
//   //       bottom: 0,
//   //       child: FittedBox(
//   //         child: Text(
//   //           label,
//   //           style: const TextStyle(
//   //             fontSize: 8,
//   //           ),
//   //         ),
//   //       ),
//   //     ),
//   //   ],
//   // );
//   return Column(
//     children: [
//       largeBar,
//       Align(
//         alignment: Alignment.bottomCenter,
//         child: FittedBox(
//           child: Text(
//             label,
//             style: const TextStyle(
//               fontSize: 6,
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
//   final largeBarLocal = SizedBox(
//     width: 1,
//     child: true
//         ? largeBar
//         : Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               largeBar,
//               const SizedBox(
//                 height: 1,
//               ),
//               // Align(
//               //   alignment: Alignment.bottomCenter,
//               //   child: FittedBox(
//               //     child: Text(
//               //       label,
//               //       style: const TextStyle(
//               //         fontSize: 6,
//               //       ),
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//   );

//   return true ? largeBar : largeBarLocal;
// }

// Widget _buildBar({
//   required int index,
// }) {
//   final multipleOfFive = index % 5 == 0;
//   if (multipleOfFive) {
//     return _buildLargeBar(
//       index,
//     );
//   }
//   Widget smallBar = const RulerBar(
//     size: Size(
//       1,
//       8,
//     ),
//   );
//   smallBar = Column(
//     children: [
//       smallBar,
//       Container(),
//     ],
//   );
//   return smallBar;
// }

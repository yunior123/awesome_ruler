import 'package:flutter/material.dart';

import 'ruler_bar.dart';

class MV30 extends StatelessWidget {
  final double barVerticalPadding;
  final max = 7;
  const MV30({
    Key? key,
    required this.barVerticalPadding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                const SizedBox(
                  height: 10,
                ),
                _buildCore(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCore() {
    final coreBars = <Widget>[];

    for (var i = 0; i < max; i++) {
      if (i == 0) {
        coreBars.add(_buildIntervalBox(i, invisibleTill: 2));
      } else if (i == max - 1) {
        coreBars.add(_buildIntervalBox(i, invisibleFrom: 2));
      } else {
        coreBars.add(_buildIntervalBox(i));
      }
    }
    return Column(
      children: coreBars,
    );
  }

  Widget _buildIntervalBox(
    final int boxCount, {
    int invisibleTill = 0,
    int invisibleFrom = 5,
  }) {
    var label = (0.5 * (max - boxCount - 1)).toStringAsFixed(1);

    final bars = <Widget>[];

    for (var i = 0; i < 5; i++) {
      final invisible = i < invisibleTill || i > invisibleFrom;
      if (i == 2) {
        bars.add(
          _getLargeHorizontalBar(
            Colors.white,
            size: const Size(
              12,
              1,
            ),
          ),
        );
      } else {
        bars.add(
          _getSmallHorizontalBar(
            invisible ? Colors.transparent : Colors.white,
          ),
        );
      }
    }

    final scale = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: bars,
        ),
        Align(
          alignment: Alignment.centerRight,
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
    if (boxCount == 0) {
      const mv = FittedBox(
        child: Text(
          "mV",
          style: TextStyle(
            fontSize: 10,
            color: Colors.white,
          ),
        ),
      );
      return Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          scale,
          const Positioned(
            right: 6,
            child: mv,
          ),
        ],
      );
    }
    return scale;
  }

  Widget _getLargeHorizontalBar(
    Color color, {
    Size size = const Size(
      12,
      1,
    ),
  }) =>
      RulerBar(
        barVerticalPadding: barVerticalPadding,
        barHorizontalPadding: 0,
        color: color,
        size: size,
      );

  Widget _getSmallHorizontalBar(
    Color color, {
    final bool usecontainer = true,
    Size size = const Size(
      8,
      1,
    ),
  }) {
    final ruler = RulerBar(
      barVerticalPadding: barVerticalPadding,
      barHorizontalPadding: 0,
      color: color,
      size: size,
    );
    if (!usecontainer) {
      return ruler;
    }
    return Column(
      children: [
        ruler,
        Container(),
      ],
    );
  }
}

// import 'package:flutter/material.dart';

// import 'ruler_bar.dart';

// class MV30 extends StatelessWidget {
//   const MV30({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 25,
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     padding: EdgeInsets.zero,
//                     physics: const AlwaysScrollableScrollPhysics(),
//                     itemCount: 31,
//                     itemBuilder: (context, index) {
//                       final multipleOfFive = index % 5 == 0;
//                       if (multipleOfFive) {
//                         const bar = RulerBar(
//                           size: Size(
//                             12,
//                             1,
//                           ),
//                         );
//                         return bar;
//                       }
//                       const bar = RulerBar(
//                         size: Size(
//                           8,
//                           1,
//                         ),
//                       );
//                       return Row(
//                         children: [
//                           bar,
//                           Container(),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'draggable_positioned.dart';
import 'ruler.dart';
import 'squares_background.dart';

class RulerEnv extends StatelessWidget {
  const RulerEnv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // x = (y - 6) / 10

    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Stack(
          children: const [
            SquaresBackground(),
            DraggablePositioned(
              child: Ruler(
                barHorizontalPadding: (60 - 6) / 10,
                barVerticalPadding: (50 - 6) / 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

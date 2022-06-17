import 'package:flutter/material.dart';

class SquaresBackground extends StatelessWidget {
  const SquaresBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // create grid with enough squares to fill the entire screen
    final grid = List<List<Widget>>.generate(
      (MediaQuery.of(context).size.height / 50).floor(),
      (row) => List<Widget>.generate(
        (MediaQuery.of(context).size.width / 60).floor(),
        (column) => Container(
          color: Colors.black,
          padding: const EdgeInsets.only(
            top: 1,
            left: 1,
          ),
          child: Container(
            color: Colors.blueAccent,
            width: 58,
            height: 48,
          ),
        ),
      ),
    );

    return Column(
      children: grid
          .map(
            (row) => Row(
              children: row,
            ),
          )
          .toList(),
    );
  }
}

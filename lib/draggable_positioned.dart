import 'package:flutter/material.dart';

/// Generic widget to drag a positioned widget inside a stack
//This is used for example to display and drag the ruler widget
class DraggablePositioned extends StatefulWidget {
  final Widget? child;
  final EdgeInsets? edges;

  const DraggablePositioned({final Key? key, this.child, this.edges})
      : super(key: key);

  @override
  DraggablePositionedState createState() => DraggablePositionedState();
}

class DraggablePositionedState extends State<DraggablePositioned> {
  double xPosition = 0;
  double yPosition = 0;

  @override
  Widget build(final BuildContext context) {
    return Positioned(
      top: yPosition,
      left: xPosition,
      child: GestureDetector(
        onPanUpdate: (final tapInfo) {
          setState(() {
            xPosition += tapInfo.delta.dx;
            yPosition += tapInfo.delta.dy;
            // If position has constraints update them to fit the constraints
            if (widget.edges != null) {
              final edges = widget.edges!;

              final maxY = MediaQuery.of(context).size.height - edges.top;
              final maxX = MediaQuery.of(context).size.width - edges.right;

              xPosition = xPosition.clamp(0, maxX - 20);
              yPosition = yPosition.clamp(0, maxY - 20);
            }
          });
        },
        child: widget.child,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

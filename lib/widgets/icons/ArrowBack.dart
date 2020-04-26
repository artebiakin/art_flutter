import 'package:art_flutter/globalVariables.dart';
import 'package:flutter/material.dart';

class ArrowBack extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint fill = Paint()
      ..color = white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    Path path = Path()
      ..moveTo(size.width * .7, 0)
      ..lineTo(size.width * .2, size.height * .5)
      ..lineTo(size.width * .7, size.height);

    canvas.drawPath(path, fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
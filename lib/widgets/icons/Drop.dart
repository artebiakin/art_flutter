import 'package:art_flutter/globalVariables.dart';
import 'package:flutter/material.dart';

class Drop extends StatelessWidget {
  const Drop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DropPaint(),
    );
  }
}

class DropPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint fill = Paint()
      ..color = white
      ..style = PaintingStyle.fill;

    Path dropGeometry = Path()
      ..moveTo(size.width / 2, 0)
      ..cubicTo(size.width * .54, size.height * .047, size.width * .517,
          size.height * .022, size.width * .499, 0)
      ..cubicTo(size.width * .4797, size.height * .0235, size.width * .458,
          size.height * .049, size.width * .435, size.height * .074)
      ..cubicTo(size.width * .3, size.height * .228, size.height * .114,
          size.width * .447, size.height * .114, size.width * .614)
      ..cubicTo(size.width * .115, size.width * .722, size.height * .156,
          size.width * .817, size.height * .225, size.width * .887)
      ..cubicTo(size.width * .296, size.width * .956, size.height * .39,
          size.width, size.width * .5, size.width)
      ..cubicTo(size.width * .605, size.width, size.width * .702,
          size.width * .958, size.width * .771, size.width * .887)
      ..cubicTo(size.width * .84, size.width * .817, size.width * .885,
          size.width * .72, size.width * .885, size.width * .614)
      ..cubicTo(size.width * .885, size.width * .447, size.width * .6974,
          size.height * .23, size.width / 2, 0);

    Path lineGeometry = Path()
      ..moveTo(size.width * .325, size.height * .5662)
      ..lineTo(size.width * .405, size.height * .5662)
      ..cubicTo(size.width * .405, size.width * .65, size.height * .445,
          size.width * .692, size.height * .526, size.width * .692)
      ..cubicTo(size.height * .526, size.width * .744, size.height * .526,
          size.width * .772, size.height * .526, size.width * .772)
      ..cubicTo(size.width * .392, size.width * .772, size.height * .325,
          size.width * .703, size.height * .325, size.height * .5662);

    Path result =
        Path.combine(PathOperation.difference, dropGeometry, lineGeometry);

    canvas.drawPath(result, fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

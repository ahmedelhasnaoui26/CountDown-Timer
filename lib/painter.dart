import 'package:flutter/material.dart';
import 'dart:math' as math;

class Painter extends CustomPainter {
  final Animation animation;
  final Color colorC, colorA;
  final BuildContext context;
  Painter({this.animation, this.colorC, this.colorA,this.context});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = colorC
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;

    canvas.drawCircle(size.center(Offset.zero), 150, paint);
    Paint paint2 = Paint()
      ..color = colorA
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;
    double procces = (1 - animation.value) * 2 * math.pi;
    canvas.drawArc(
        Rect.fromCenter(
            center: size.center(Offset.zero),
            width: 300,
            height: 300),
        -math.pi / 2,
        procces,
        false,
        paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

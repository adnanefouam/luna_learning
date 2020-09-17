import 'package:flutter/material.dart';
import 'dart:math' as math;

class CirlePainter extends CustomPainter {
  final Color theColor;
  final  double strockWidth;
  CirlePainter({this.theColor,this.strockWidth});
  @override
  void paint(Canvas canvas, Size size) {
    final side = size.width < size.height ? size.width : size.height;
    final rect = new Rect.fromLTWH(0.0, 0.0, side, size.height);
    final startAngle = -math.pi / 1.9;
    final sweepAngle = math.pi * 1.50;
    final useCenter = false;
    final paint = Paint()
      ..color = theColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strockWidth;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CirlePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CirlePainter oldDelegate) => false;
}
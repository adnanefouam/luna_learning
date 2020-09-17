import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../SizeConfig.dart';
import 'utilites_radian.dart';

class SpeedTrackerPainter extends CustomPainter {
  final double degValue;
  final Color color;
  final Color inactiveColor;

  SpeedTrackerPainter(this.degValue, this.color, this.inactiveColor);
  @override
  void paint(Canvas canvas, Size size) {
    final List<Color> colorList = [color, color, color, inactiveColor];
    final centerPoint = Offset(size.width / 2, size.height / 1.5);
    final radius = min(size.width, size.height) / 1;
    final strokeWidth = SizeConfig.blockSizeHorizontal * 2.2;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final n = 4;
    final eachDegree = -(degValue / n);
    final rect = Rect.fromCircle(
        center: centerPoint, radius: radius - (strokeWidth / 2));
    for (var i = 0; i < n; i++) {
      paint.color = colorList[i];
      canvas.drawArc(
        rect,
        Utils.degreeToRadian(i * eachDegree),
        Utils.degreeToRadian(eachDegree),
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

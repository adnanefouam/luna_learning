import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Utils {

  static double degreeToRadian(double degree) => (degree * pi) / 180;

  static Color colorRandom({double opacity = 1}) {
    final rand = Random();
    return Color.fromRGBO(rand.nextInt(255), rand.nextInt(255),rand.nextInt(255), opacity);
  }

  static void drawIcon(Canvas canvas, IconData icon, Offset drawPoint, {Color color = Colors.white, double size = 30}){
    final paragraph = ui.ParagraphBuilder(ui.ParagraphStyle(fontSize: size,textAlign: TextAlign.center));
    paragraph.pushStyle(ui.TextStyle(color: color, fontFamily: icon.fontFamily));
    paragraph.addText(String.fromCharCode(icon.codePoint));
    canvas.drawParagraph(paragraph.build()..layout(ui.ParagraphConstraints(width: Size.infinite.width)), drawPoint);
  }

  static ui.Paragraph generateParagraph(String text,{ui.TextStyle style}){
    final paragraph = ui.ParagraphBuilder(ui.ParagraphStyle());
    paragraph.pushStyle(style);
    paragraph.addText(text);
    return paragraph.build()..layout(ui.ParagraphConstraints(width: Size.infinite.width));
  }

}
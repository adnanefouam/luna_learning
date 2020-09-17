import 'package:flutter/material.dart';
class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  final double begin;
  ScaleRoute({this.page,this.begin=0.0})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        ScaleTransition(

          scale: Tween<double>(
            begin: begin,
            end: 1.02,
          ).animate(
            CurvedAnimation(

              parent: animation,
                curve: Interval(0.4, 1.0, curve: Curves.easeInOut),
            ),
          ),
          child: child,
        ),
  );
}
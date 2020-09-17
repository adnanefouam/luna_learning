import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:luna_learning/screens/Courses_screen.dart';
import 'package:luna_learning/screens/Home.dart';
import 'package:luna_learning/utilities/scal_route_transition.dart';
import 'package:luna_learning/utilities/styles.dart';

class FloatingDialog extends StatefulWidget {
  final String imageRoute;
  final String title;
  final Widget image;
  final Color color;

  FloatingDialog({this.title, this.image, this.imageRoute, this.color});
  @override
  _FloatingDialogState createState() => _FloatingDialogState();
}

class _FloatingDialogState extends State<FloatingDialog>
    with TickerProviderStateMixin {
  double _dragStartYPosition;
  double _dialogYOffset;

  AnimationController _returnBackController;
  Animation<double> _dialogAnimation;

  @override
  void initState() {
    super.initState();
    _dialogYOffset = 0.0;
    _returnBackController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1300))
          ..addListener(() {
            setState(() {
              _dialogYOffset = _dialogAnimation.value;
            });
          });
  }

  @override
  void dispose() {
    _returnBackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
        bottom: 100.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Transform.translate(
        offset: Offset(0.0, _dialogYOffset),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Colors.white.withOpacity(0.3)),
                      shape: BoxShape.circle,
                      color: glassyColor.withOpacity(0.3)),
                  child: Icon(Icons.keyboard_arrow_up,
                      color: Colors.black.withOpacity(0.3)),
                ),
              ],
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    ScaleRoute(
                        page: CourseScreen(
                          title: widget.title,
                          imageRoute: widget.imageRoute,
                          image: widget.image,
                          color: widget.color,
                        ),
                        begin: 0.85),
                  );
                },
                onVerticalDragStart: (dragStartDetails) {
                  _dragStartYPosition = dragStartDetails.globalPosition.dy;
                  print(dragStartDetails.globalPosition);
                },
                onVerticalDragUpdate: (dragUpdateDetails) {
                  setState(() {
                    _dialogYOffset = (dragUpdateDetails.globalPosition.dy) -
                        _dragStartYPosition;
                  });
                  print(_dialogYOffset);
                  if (_dialogYOffset < -130.0) {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      ScaleRoute(
                        page: CourseScreen(
                          title: widget.title,
                          imageRoute: widget.imageRoute,
                          image: widget.image,
                          color: widget.color,
                        ),
                      ),
                    );
                  } else if (_dialogYOffset > 140.0) {
                    Navigator.of(context).pop(ScaleRoute(page: LunaHome()));
                  }
                },
                onVerticalDragEnd: (dragEndDetails) {
                  _dialogAnimation = Tween(begin: _dialogYOffset, end: -10.0)
                      .animate(CurvedAnimation(
                          parent: _returnBackController,
                          curve: Curves.elasticOut));
                  _returnBackController.forward(from: _dialogYOffset);

                  _returnBackController.forward(from: 0.0);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CourseScreen(
                    title: widget.title,
                    imageRoute: widget.imageRoute,
                    image: widget.image,
                    color: widget.color,
                    isPreview: true,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: <Widget>[
                  Card(
                      color: Colors.transparent,
                      shadowColor: Colors.transparent,
                      child: Text(
                        "CANCEL",
                        style: bigText.copyWith(
                            fontSize: 14, color: glassyColor.withOpacity(0.5)),
                      )),
                  Icon(Icons.keyboard_arrow_down,
                      color: glassyColor.withOpacity(0.2)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

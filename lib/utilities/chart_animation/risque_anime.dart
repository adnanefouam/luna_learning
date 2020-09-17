import 'package:flutter/material.dart';
import 'package:luna_learning/utilities/chart_animation/risque_painter.dart';

import '../SizeConfig.dart';
import '../styles.dart';



class SpeedTracker extends StatefulWidget  {

  @override
  _SpeedTrackerState createState() => _SpeedTrackerState();
}


class _SpeedTrackerState extends State<SpeedTracker> with TickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(


      vsync: this,
        duration: const Duration(milliseconds: 2500),
    );


    Tween<double> _degValue = Tween(begin: 0.0, end: 360.0);
    animation= _degValue.animate(CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn

    ))..addListener(() {
      setState(() {
      });


    })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });





    controller.forward();
    super.initState();


  }
  @override
  void dispose() {
   controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    return Container(
      height: SizeConfig.blockSizeVertical*6,
      width: SizeConfig.blockSizeVertical*6,


      child: CustomPaint(
        child: Text(
          "70%",
          style:
          new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.white),
        ),

        size: Size(200,200),
        painter: SpeedTrackerPainter(animation.value,
            secondarycolor,glassyColor),
      ),
    );
  }
}
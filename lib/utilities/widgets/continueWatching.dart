import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luna_learning/utilities/styles.dart';
List<Color> colors =[
  Color(0XFF8094C7),
  Color(0XFFE3857E),
  Color(0XFF8E83A6),
  Color(0XFF8094C7),


];
List<double> widths =[
  40,
  100,
  70,
  130


];
List<String> logos =[

  "flutPNG.png",
  "figma_icon.png",
  "siftLogo.png",
  "flutPNG.png",


];
List<Text> titles =[
  Text('Flutter for designers',style: bigText.copyWith(fontSize: 22),),
  Text('The Figma Handbook',style: bigText.copyWith(fontSize: 22),),
  Text('Swift Handbook',style: bigText.copyWith(fontSize: 22),),
  Text('The Figma Handbook',style: bigText.copyWith(fontSize: 22),),


];


class BuildContinueWatching extends StatefulWidget {
  @override
  _BuildContinueWatchingState createState() => _BuildContinueWatchingState();
}


class _BuildContinueWatchingState extends State<BuildContinueWatching> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/Cards');
      },
      child: Container(
        height: 230,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, i) {
            currentPage=i;
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                height: 260,
                width: 190,

                decoration:BoxDecoration( color:Colors.white.withOpacity(0.10),borderRadius:BorderRadius.circular(22)) ,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: GradientBorderButtonContainer(
                    gradient: LinearGradient(
                      colors: [Colors.white.withOpacity(0.2),Colors.white.withOpacity(0.2),],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [
                        0.1,
                        0.4,

                      ],),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaY: 18, sigmaX: 18),
                        child: Container(

                          padding: EdgeInsets.only(left: 20,bottom: 20,top: 20,),

                          margin: EdgeInsets.only(right: 20),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8),
                                height: 54,
                                width:  54,
                                decoration: BoxDecoration(
                                    color: Color(0XFFC4C4C4).withOpacity(0.2),

                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white
                                            .withOpacity(0.26))),
                                child:Container(
                                  padding: EdgeInsets.all(4),
                                  height: 54,
                                  width:  54,

                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0XFF333231)
                                  ),
                                  child: Image.asset('assets/images/${logos[i]}'),
                                ) ,
                              ),
                              titles[i],
                              Text('A comprehensive guid to the best tips and tricks in Flutter',style:description,),
                              SizedBox(height: 6,),
                              Stack(
                                children: <Widget>[

                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Container(
                                      width: 400,
                                      height: 4,
                                      color: Color(0XFFB2B2B2),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Container(

                                        width: widths[i],
                                        height: 4,
                                        color:colors[i]
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}




class GradientPainter extends CustomPainter {
  GradientPainter({this.gradient, this.strokeWidth});
  final Gradient gradient;
  final double strokeWidth;
  final Paint paintObject = Paint();
  @override
  void paint(Canvas canvas, Size size) {
    Rect innerRect = Rect.fromLTRB(strokeWidth, strokeWidth, size.width+strokeWidth , size.height+strokeWidth);
    Rect outerRect = Offset.zero & size;
    paintObject.shader = gradient.createShader(outerRect);
    Path borderPath = _calculateBorderPath(outerRect, innerRect);
    canvas.drawPath(borderPath, paintObject);
  }
  Path _calculateBorderPath(Rect outerRect, Rect innerRect) {
    Path outerRectPath = Path()..addRect(outerRect);
    Path innerRectPath = Path()..addRect(innerRect);
    return Path.combine(PathOperation.difference, outerRectPath, innerRectPath);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class GradientBorderButtonContainer extends StatelessWidget {
   GradientBorderButtonContainer({
    @required gradient,
    @required this.child,
    this.strokeWidth = 2.5,
     this.onPressed,
  }) : this.painter = GradientPainter(
      gradient: gradient, strokeWidth: strokeWidth
  );
  final GradientPainter painter;
  final Widget child;
   final VoidCallback onPressed;
  final double strokeWidth;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: painter,
        child: child
    );
  }
}
import 'package:flutter/material.dart';
import 'package:luna_learning/utilities/widgets/painters/circle_painter.dart';

class CustomAppBar extends PreferredSize {
  final Widget child;
  final double height;
  final double width;

  CustomAppBar({this.child, this.height = kToolbarHeight,this.width=100});

  @override
  Size get preferredSize => Size.fromHeight(height);
  Size get preferredSizeWidth => Size.fromWidth(width);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Colors.transparent,
      alignment: Alignment.center,
      child:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 40,
              width: 40,

              decoration:
              BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.13) ,


              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 2.5,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Color(0XFFB38CA1)),),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 4.5),
                    height: 2.5,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Color(0XFFB38CA1)),),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 2.5,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Color(0XFFB38CA1)),),
                ],
              ),
            ),

            Stack(
              children: <Widget>[
                Container(



                  child: CustomPaint(
                    child: Center(
                      child: Container(

                          margin: EdgeInsets.all(8),
                          child: CircleAvatar(child:Image.asset("assets/images/smilyGirl.png") ,)),


                    ) ,

                    painter: CirlePainter(theColor: Color(0XFF949194).withOpacity(0.5),strockWidth:4),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

Widget bubleDecoration(){

  return Column(
    children: <Widget>[
      Container(


        height: 150,width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(

              right: -40,
              child: Container(height: 100,width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(

                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.21,0.75],
                    colors: [
                      Color(0XFFE3857E),
                      Color(0XFF8094C7),
                    ],
                  ),

                ),
              ),
            ),
            Positioned(
              right: 40,

              bottom: 0,
              child: Container(height: 30,width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(

                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.21,0.75],
                    colors: [
                      Color(0XFFE3857E),
                      Color(0XFF8094C7),



                    ],
                  ),

                ),


              ),


            ),



          ],
        ),),

      Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        height: 120,width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: -20,
              child: Container(height: 120,width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(

                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.21,0.75],
                    colors: [
                      Color(0XFFD1854B),
                      Color(0XFF8094C7),
                    ],
                  ),

                ),
              ),
            ),
            Positioned(
              left: 60,

              bottom: 0,
              child: Container(height: 30,width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(

                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.21,0.75],
                    colors: [
                      Color(0XFFD1854B),
                      Color(0XFF8094C7),



                    ],
                  ),

                ),


              ),


            ),



          ],
        ),),
    ],
  );
}
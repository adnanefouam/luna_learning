import 'package:flutter/material.dart';

import '../../styles.dart';



class MyFlexiableAppBar extends StatelessWidget {
  final String image;
  final Color color;
  final String title;



  final double appBarHeight = 66.0;
  MyFlexiableAppBar({this.image,this.color,this.title});



  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return SafeArea(



      child: new Container(

        padding: new EdgeInsets.only(top: statusBarHeight),
        height: statusBarHeight + appBarHeight,

        decoration: new BoxDecoration(
          color: color,

        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Stack(children: <Widget>[




            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20  ),
              child: Column(children: <Widget>[


                Column(

                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(title,style: bigText.copyWith(fontSize: 30),),
                    Padding(
                      padding: const EdgeInsets.only(right: 40,left: 40),
                      child: Hero(
                        tag : image,

                          child: Image.asset(image)),
                    ),


                  ],
                ),

              ],),
            ),


          ],),
        ),
      ),
    );
  }
}
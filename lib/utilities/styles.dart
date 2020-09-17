

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final  primarycolor= Color(0XFFE3857E);
final secondarycolor= Color(0XFF8094C7);
final tertiarycolor= Color(0XFF8E83A6);
final quaternarycolor= Color(0XFFA98668);
final lightgrey= Color(0XFFEDEDED);
final glassyColor = Colors.white.withOpacity(0.13);


final bigText = TextStyle(

  color: lightgrey,
  fontFamily: 'Oxygen',
  fontSize: 22.0,



);
final description = TextStyle(

  color: Color(0XFFB1B1B1),
  fontFamily: 'Oxygen',
  fontSize: 12.0,



);
final smallText = TextStyle(

  color:lightgrey ,
  fontFamily: 'Oxygen',
  fontSize: 14.0,



);

Widget courseLogo(String asset){
  return   Container(
    padding: EdgeInsets.all(8),
    height: 60,
    width:  60,
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
      child: Image.asset(asset),
    ) ,
  );
}

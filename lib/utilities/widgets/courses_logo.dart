import 'package:flutter/material.dart';

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
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:luna_learning/utilities/styles.dart';

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = 210;
    double width = 320;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    left: 20,
                    top: -40,

                    child: CreditCard(

                      fontColor: Colors.white,
                      height: height,
                      width: width-40,
                      bgColor: secondarycolor,
                    ),
                  ),
                  Positioned(

                    left: 10,
                    top: -20,
                    child: CreditCard(
                      fontColor: Colors.white,
                      height: height,
                      width: width-20,
                      bgColor: primarycolor,
                    ),
                  ),
                  CreditCard(
                    fontColor: Colors.white,
                    height: height,
                    width: width,
                    bgColor: tertiarycolor,
                  ),
                  Positioned(
                    top: 50,
                    left: 80,
                    child: Transform.rotate(
                      angle: -25,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),

                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 16, sigmaX: 16),

                          child: CreditCard(
                            isGlass:true,
                            fontColor: Colors.white.withOpacity(0.3),
                            height: height,
                            width: width,
                            bgColor: Colors.white.withOpacity(0.1),
                          ),
                        ),
                      ),
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

class CreditCard extends StatelessWidget {
   CreditCard({
    Key key,
    @required this.height,
    @required this.width,
    this.bgColor,
    this.fontColor,
    this.isGlass=false
  }) : super(key: key);

  final double height;
  final double width;
  final Color bgColor;
  final Color fontColor;
  final bool isGlass ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: bgColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  width: 55, child:  isGlass==true ? Image.asset("assets/images/VisaGlass.png") : Image.asset("assets/images/visaWhite.png")),
              Icon(
                Icons.more_horiz,
                color: fontColor,
              )
            ],
          ),
          Text(
            '5523  2394  2399 1293',
            style: TextStyle(
                color: fontColor,
                fontSize: 24.4,
                fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Card Holder',
                    style: TextStyle(
                        color: fontColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'FOUHAM',
                    style: TextStyle(
                        color: fontColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Expiriy',
                    style: TextStyle(
                        color: fontColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '06/12',
                    style: TextStyle(
                        color:fontColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

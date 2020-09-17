import 'dart:ui';

import 'package:flutter/material.dart';

import '../styles.dart';

Widget commingsoon(BuildContext ctx){

  return
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Container(

        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(ctx).size.width,
              height: 120,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                      AssetImage('assets/images/luna.jpg'))),
            ),
            Container(
              width: MediaQuery.of(ctx).size.width,
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end:  Alignment.bottomCenter,

                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.white.withOpacity(0.15),
                    ]

                ),

                borderRadius: BorderRadius.circular(18),

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 60,
                      color: Colors.transparent,
                      child: Stack(
                        children: <Widget>[
                          Container(



                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                    AssetImage('assets/images/luna.jpg')),


                                shape: BoxShape.circle),),
                          ClipRRect(
                            borderRadius:BorderRadius.circular(100) ,
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 16,sigmaY: 16),
                              child: Container(
                                  padding: EdgeInsets.only(top: 16,bottom: 16,left: 4),

                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      



                                      color: Color(0XFFE3857E).withOpacity(0.4),
                                      shape: BoxShape.circle),
                                  child: Image.asset('assets/images/Play.png')
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),

                    Align(
                        alignment: Alignment.bottomLeft,

                        child: Text('Comming soon',style: bigText.copyWith(fontSize: 20),)),
                  ],
                ),
              ),


            ),

          ],
        ),
      ),
    );


}
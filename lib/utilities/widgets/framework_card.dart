import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luna_learning/utilities/widgets/courses_logo.dart';


import '../styles.dart';

class FrameworkSection extends StatelessWidget {
  final Map <String,String> sections;
  final Color sectionsColor;
  final String logo;
  final String title;

  FrameworkSection({this.sections,this.sectionsColor,this.logo,this.title});
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      child:
      ClipRRect(
        borderRadius: BorderRadius.circular(14),

        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 16, sigmaX: 16),


          child:  Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white.withOpacity(0.12),
            ),


            padding: EdgeInsets.only(left: 20,bottom: 20,top: 20,),



            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,


                  children: <Widget>[

                    courseLogo(logo),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),

                        width: 150,
                        child: Text('$title for designers',style: bigText.copyWith(fontSize: 16),)),
                    Container(
                        width: 150,

                        child: Text('A comprehensive guid to the best tips and tricks in $title',style:description.copyWith(fontSize: 12),)),

                  ],),
                SizedBox(width: 4,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: sections.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,

                          itemBuilder: (context,i){
                            return
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(children: <Widget>[
                                  Container(
                                   height:20,
                                    width: 20,
                                    child:
                                    Center(child: Text(sections.keys.toList()[i],style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 10,fontFamily: "Oxygen"),)),
                                    decoration: BoxDecoration(shape: BoxShape.circle,color: sectionsColor),
                                    padding: EdgeInsets.all(4)
                                    ,),
                                  SizedBox(width: 5,),
                                  Container(
                                      width:160,

                                      child: Text(sections.values.toList()[i],style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),)),
                                ],),
                              );
                          }

                      ),
                    ],
                  ),
                )

              ],),//
          ),
        ),

      ),
    );
  }
}

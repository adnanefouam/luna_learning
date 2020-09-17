import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luna_learning/screens/Courses_screen.dart';
import 'package:luna_learning/screens/Home.dart';

import 'package:luna_learning/utilities/styles.dart';
import 'package:luna_learning/utilities/widgets/preview.dart';

import '../scal_route_transition.dart';

List<Color> colors = [
  Color(0XFF8094C7),
  Color(0XFFE3857E),
  Color(0XFF8E83A6),
  Color(0XFF8094C7),
  Color(0XFFE3857E),
];
List<Container> images = [
  Container(
    height: 80,
    child: Image.asset('assets/images/UIForFlutter.png'),
  ),
  Container(
    height: 80,
    padding: EdgeInsets.only(left: 10),
    child: Image.asset('assets/images/DataManag.png'),
  ),
  Container(
    height: 80,
    child: Image.asset('assets/images/readingWomen.png'),
  ),
  Container(
    height: 80,
    child: Image.asset('assets/images/Mancoding.png'),
  ),
  Container(
    height: 80,
    width: 200,
    child: Image.asset('assets/images/drawCarac.png'),
  ),
];
List<String> imagesRoutes = [
  'assets/images/UIForFlutter.png',
  'assets/images/DataManag.png',
  'assets/images/readingWomen.png',
  'assets/images/Mancoding.png',
  'assets/images/drawCarac.png',
];

List<String> titles = [
  'Flutter for designers',
  'Data structures',
  'DevOps',
  'UI/UX architecture',
  'Draw illustrations',
];




Widget buildCourses() {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text("Students are viewing",style: bigText,),
      ),
      SizedBox(height: 20,),
      Container(

        height: 190,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, i) {
            return Padding(
              padding:  EdgeInsets.only(right: 16),
              child: GestureDetector(


                onLongPress: () {

                  HapticFeedback.heavyImpact();
                  showGeneralDialog(

                      context: context,
                      barrierDismissible: true,
                      barrierLabel: "",

                      transitionDuration: Duration(milliseconds: 200),
                      pageBuilder: (context, pAnim, sAnim) {
                        return Stack(

                          children: <Widget>[
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).pop(ScaleRoute(page:LunaHome()));

                              },
                              child: ClipRRect(
                                child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaY: 12, sigmaX: 12),

                                    child: Container(color:Colors.white.withOpacity(0.05),height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,)),
                              ),
                            ),
                            FloatingDialog(

                              image: images[i],
                              color: colors[i],
                              title: titles[i],
                              imageRoute: imagesRoutes[i],
                            ),
                          ],
                        );
                      },
                      transitionBuilder: (context, pAnim, sAnim, child) {
                        if (pAnim.status == AnimationStatus.reverse) {
                          return FadeTransition(
                            opacity: Tween(begin: 0.0, end: 0.0).animate(pAnim),
                            child: child,
                          );
                        } else {
                          return FadeTransition(
                            opacity: pAnim,
                            child: child,
                          );
                        }
                      });
                },
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(


                        pageBuilder: (context, pAnim, sAnim) => CourseScreen(title: titles[i],imageRoute: imagesRoutes[i],image: images[i],color: colors[i],),

                        transitionDuration: Duration(milliseconds: 200),
                        transitionsBuilder: (context, pAnim, sAnim, child) {
                          if (pAnim.status == AnimationStatus.forward) {
                            return ScaleTransition(
                              scale: Tween(begin: 0.5, end: 1.0).animate(
                                  CurvedAnimation(

                                      parent: pAnim,
                                      curve: Curves.fastOutSlowIn)),
                              child: child,
                            );
                          } else {
                            return FadeTransition(
                              opacity: pAnim,
                              child: child,
                            );
                          }
                        }),
                  );

                },
                child: BuildCoursesCarousel(
                  image: images[i],
                  color: colors[i],
                  title: titles[i],
                  imageRoute: imagesRoutes[i],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

class BuildCoursesCarousel extends StatelessWidget {
  final String imageRoute;
  final String title;
  final Widget image;
  final Color color;

  BuildCoursesCarousel({this.title, this.image, this.imageRoute, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      height: 200,
      width: 160,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Hero(tag: imageRoute, child: image),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: bigText.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '30 videos',
                    style: bigText.copyWith(
                        fontSize: 11, color: Colors.white.withOpacity(0.5)),
                  ),
                  Text(
                    '3 sections',
                    style: bigText.copyWith(
                        fontSize: 11, color: Colors.white.withOpacity(0.5)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}




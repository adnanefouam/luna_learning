import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:luna_learning/utilities/styles.dart';

import 'package:luna_learning/utilities/widgets/sliverAppbar/FlexableAppBar.dart';


class CourseScreen extends StatefulWidget {
  final String imageRoute;
  final String title;
  final Widget image;
  final Color color;
   final  bool isPreview;

  CourseScreen({this.title, this.image, this.imageRoute, this.color,this.isPreview=false});

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> with TickerProviderStateMixin{

  Map<String,String> bottom= {
    "2 lectures": "26 min",

    "4 lectures": "30 min",

    "1 lectures": "14 min",

    "5 lectures": "17 min",

    "3 lectures": "12 min",

    "9 lectures": "34 min",

    "6 lectures": "10 min",

    "8 lectures": "16 min",

  };
  bool show = false;
  bool scrollOrNot = true;

  void showOrHide() {
    if (_scrollController.position.pixels >= 141) {
      setState(() {
        show = true;
      });
    } else {
      setState(() {
        show = false;
      });
    }

    if((_scrollController.position.pixels==_scrollController.position.minScrollExtent || _scrollController.position.pixels==_scrollController.position.maxScrollExtent) && widget.isPreview==true){
      setState(() {
        scrollOrNot = false;
      });

    }
  }

  final _scrollController = new ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      print(_scrollController.position.pixels);
      showOrHide();
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.07, 0.08, 1],
            colors: [
              Color(0XFF2F2F2E),
              Color(0XFF2F2F2E),
              Color(0XFF050505),
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            CustomScrollView(
               physics:widget.isPreview==true? NeverScrollableScrollPhysics():null,
              controller: _scrollController,
              slivers: <Widget>[
                SliverAppBar(


                  centerTitle: false,
                  backgroundColor: widget.color,
                  leading: Text(''),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1,color: Colors.white.withOpacity(0.3)),
                                shape: BoxShape.circle,
                                color: glassyColor.withOpacity(0.3)


                              ),
                              child: Icon(Icons.close,
                                  color: Colors.black.withOpacity(0.3)) ,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  pinned: false,
                  expandedHeight: 350.0,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '30 videos',
                            style: bigText.copyWith(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.8)),
                          ),
                          Text(
                            '3 sections',
                            style: bigText.copyWith(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.8)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: MyFlexiableAppBar(
                      image: widget.imageRoute,
                      color: widget.color,
                      title: widget.title,
                    ),
                  ),
                ),
                SliverToBoxAdapter(

                  child: _buildContent(widget.imageRoute,widget.title,widget.image,widget.color),
                ),

              ],
            ),
            show==true ?  Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: bottomNavigationBar(widget.color,widget.title),

            ):Text(''),
          ],
        ));
  }
}


Widget _buildContent( String imageRoute,
 String title,
 Widget image,
 Color color,) {



  return Stack(
    children: <Widget>[

      Card(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: bigText.copyWith(color: color,fontWeight: FontWeight.w600),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: glassyColor,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            "Best Seller",
                            style: TextStyle(color: Colors.green,fontSize: 12),
                          ),
                        ))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Course Description',
                  style: bigText.copyWith(fontSize: 16,fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nunc ut vel dui in aenean. Ornare tellus fringilla malesuada eu auctor. Massadiam libero egestas lectus.',
                style: description.copyWith(fontSize: 16),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nunc ut vel dui in aenean. Ornare tellus fringilla malesuada eu auctor. Massadiam libero egestas lectus.psum dolor sit amet, consectetur adipiscing elit. Sed nunc ut vel dui in aenean. Ornare tellus fringilla malesuada eu auctor. Massadiam libero egestas lectus.psum dolor sit amet, consectetur adipiscing elit. Sed nunc ut vel dui in aenean. Ornare tellus fringilla malesuada eu auctor. Massadiam libero egestas lectus. psum dolor sit amet, consectetur adipiscing elit. Sed nunc ut vel dui in aenean. Ornare tellus fringilla malesuada eu auctor. Massadiam libero egestas lectus.',
                  style: description.copyWith(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Course Description',
                  style: bigText.copyWith(fontSize: 16,fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nunc ut vel dui in aenean. Ornare tellus fringilla malesuada eu auctor. Massadiam libero egestas lectus.',
                style: description.copyWith(fontSize: 16),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  height: 300,

                    child: Image.asset("assets/images/courseImages.png")),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Course Description',
                  style: bigText.copyWith(fontSize: 16,fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nunc ut vel dui in aenean. Ornare tellus fringilla malesuada eu auctor. Massadiam libero egestas lectus.',
                style: description.copyWith(fontSize: 16),
              ),

        Container(
            height: 120,


      ),

            ],

          ),
        ),
      ),


    ],
  );
}

Widget  bottomNavigationBar(Color color,String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
    child: Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      margin: EdgeInsets.all(0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),

        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 16, sigmaX: 16),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.13),
                    blurRadius: 20.0,
                    offset: Offset(
                      0.0, // horizontal, move right 10
                      -2.0, // vertical, move down 10
                    ),
                  ),
                ],
                color: glassyColor,
              ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 80,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.favorite_border,
                    color: glassyColor,
                    size: 26,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: bigText.copyWith(fontSize: 16,fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 4,),
                      Text(
                        'Course Description',
                        style: description.copyWith(fontSize: 12,fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),

                  Container(

                    height: 35,
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: glassyColor,
                    ),
                    child: Center(
                        child: Text(
                      'Get',
                      style: bigText.copyWith(color: color,fontSize: 13,fontWeight: FontWeight.w600),
                    )),
                  )
                ],
              )),
        ),
      ),
    ),
  );
}


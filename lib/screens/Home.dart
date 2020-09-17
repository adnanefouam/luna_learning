import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:luna_learning/utilities/SizeConfig.dart';
import 'package:luna_learning/utilities/appBar.dart';

import 'package:luna_learning/utilities/styles.dart';
import 'package:luna_learning/utilities/widgets/background.dart';
import 'package:luna_learning/utilities/widgets/chipsWidget/multiChoices.dart';
import 'package:luna_learning/utilities/widgets/comming_soon.dart';
import 'package:luna_learning/utilities/widgets/continueWatching.dart';
import 'package:luna_learning/utilities/widgets/courses.dart';
import 'package:luna_learning/utilities/widgets/progress_daily.dart';
import 'package:luna_learning/utilities/widgets/framework_card.dart';
import 'package:luna_learning/utilities/widgets/serach_field.dart';

class LunaHome extends StatefulWidget {
  @override
  _LunaHomeState createState() => _LunaHomeState();
}

Map<String, String> sections = {
  "1": "Render 60fps animations to your app",
  "2": "Build responsive layout",
  "3": "Clean architecture",
  "4": "Master smooth designs",
  "5": "State management"
};

Map<String, double> progress = {
  "73%": 0.73,
  "21%": 0.21,
  "44%": 0.44,
  "9%": 0.09,
};
const List<String> logos = [
  'assets/images/siftLogo.png',
  'assets/images/flutPNG.png'
];
List<Color> progressColors = [
  secondarycolor,
  tertiarycolor,
  primarycolor,
  quaternarycolor,
];
List<String> categories = [
  'Design',
  'Developement',
  'IT Software',
  'DevOps',
  'Phptography',
  'Business',
  'Music',
  'Marketing',
];
List<String> selectedCategoryList = [];

class _LunaHomeState extends State<LunaHome> {
  bool show = false;
  final listViewKey = new GlobalKey();
  final animatedBoxKey = new GlobalKey();
  void showOrHide() {
    if (scrollController.position.pixels >= 141) {
      setState(() {
        show = true;
      });
    } else {
      setState(() {
        show = false;
      });
    }
  }

  final scrollController = new ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      showOrHide();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(),
          body: Stack(
            children: <Widget>[
              bubleDecoration(),
              SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: <Widget>[
                      SearchFieldWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Continue watching',
                              style: bigText,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'See All',
                                  style: smallText,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                  color: lightgrey,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      BuildContinueWatching(),
                      commingsoon(context),
                      buildCourses(),
                      FrameworkSection(
                        title: "Flutter",
                        logo: logos[1],
                        sections: sections,
                        sectionsColor: secondarycolor,
                      ),
                      ProgressDialy(
                        progress: progress,
                        progressColors: progressColors,
                        show: show,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                'Progress by category',
                                style: bigText,
                              ),
                            ),
                            MultiSelectChip(
                              categories,
                              selectedReportList: selectedCategoryList,
                              onSelectionChanged: (selectedList) {
                                setState(() {
                                  selectedCategoryList = selectedList;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      FrameworkSection(
                        title: "Swift",
                        logo: logos[0],
                        sections: sections,
                        sectionsColor: primarycolor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

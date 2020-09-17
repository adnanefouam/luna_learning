import 'package:flutter/material.dart';
import 'package:luna_learning/screens/Cards.dart';
import 'package:luna_learning/screens/Courses_screen.dart';
import 'package:luna_learning/screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      initialRoute: '/',

      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => LunaHome(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/Cards': (context) => Cards(),
        '/CoursScreen': (context) => CourseScreen(),
      },
    );
  }
}



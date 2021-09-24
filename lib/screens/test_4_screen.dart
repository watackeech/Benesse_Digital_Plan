import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:digital_plan_test/screens/ButtomBarTest/screen_0.dart';
import 'package:digital_plan_test/screens/ButtomBarTest/screen_1.dart';
import 'package:digital_plan_test/screens/ButtomBarTest/screen_2.dart';
import '../palette.dart';

//参考↓
//https://pub.dev/packages/convex_bottom_bar
//https://protocoderspoint.com/flutter-bottom-navigation-bar-example-4-pages-convex-bottom-bar-library/#Step_4_How_to_use_Convex_bottom_navigation_bar_Snippet_code

class Test4Screen extends StatefulWidget {
  static String id = "test_4_screen";
  @override
  _Test4ScreenState createState() => _Test4ScreenState();
}

class _Test4ScreenState extends State<Test4Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: kPrime,
        height: 60,
        top: -20,
        activeColor: kSub1,
        color: kSub1,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
        ],
        initialActiveIndex: selectedPage,//optional, default as 0
        onTap: (int index ){
          setState(() {
            selectedPage = index;
          });
        },
      ),
      body: _pageOptions[selectedPage],
    );
  }

  int selectedPage = 0;

  final _pageOptions = [Screen_0(), Screen_1(), Screen_2()];
}

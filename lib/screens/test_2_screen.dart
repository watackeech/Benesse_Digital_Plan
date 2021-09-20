import 'package:flutter/material.dart';
import '../palette.dart';

class Test2Screen extends StatelessWidget {
  static String id = "test_2_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("テスト2"),),
        body: SafeArea(
          child: Center(
            child: Text("テスト2", style: TextStyle(fontSize: 50, color: kPrime),),
          ),
        )
    );
  }
}
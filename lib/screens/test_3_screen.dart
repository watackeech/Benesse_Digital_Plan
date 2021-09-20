import 'package:flutter/material.dart';
import '../palette.dart';

class Test3Screen extends StatelessWidget {
  static String id = "test_3_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("テスト3"),),
        body: SafeArea(
          child: Center(
            child: Text("テスト3", style: TextStyle(fontSize: 50, color: kPrime),),
          ),
        )
    );
  }
}
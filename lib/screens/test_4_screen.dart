import 'package:flutter/material.dart';
import '../palette.dart';

class Test4Screen extends StatelessWidget {
  static String id = "test_4_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("テスト4"),),
        body: SafeArea(
          child: Center(
            child: Text("テスト4", style: TextStyle(fontSize: 50, color: kPrime),),
          ),
        )
    );
  }
}
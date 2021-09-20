import 'package:flutter/material.dart';
import '../palette.dart';

class Test1Screen extends StatelessWidget {
  static String id = "test_1_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("テスト１"),),
        body: SafeArea(
          child: Center(
            child: Text("テスト１", style: TextStyle(fontSize: 50, color: kPrime),),
          ),
        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../palette.dart';

class Screen_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("テスト４_2"), centerTitle: true, backgroundColor: kPrime,),
        body: Center(child: Text("スクリーン2"),)
    );
  }
}
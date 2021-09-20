// import 'package:firebase_core/firebase_core.dart';
import 'package:digital_plan_test/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digital_plan_test/screens/home_screen.dart';
import 'package:digital_plan_test/components/rounded_button.dart';
import 'package:flutter/services.dart';




class SurveyScreen extends StatefulWidget {
  static String id = "survey_screen"; // static宣言された変数は、宣言されたクラスに紐づいていることになる。。はず。。
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  late AnimationController controller;
  late Animation animation;
  // @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("初回アンケート"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(child: Text("this is survey screen"))
      ),
      // body: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 24.0),
      //   child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: <Widget>[
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: <Widget>[
      //             Row(
      //               children: [
      //                 SizedBox(width: 56,),
      //                 Text("はいふぁいぶ！", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),),
      //               ],
      //             ),
      //             SizedBox(height: 10,),
      //             Container(
      //               height: 200,
      //               width: 200,
      //               decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.all(Radius.circular(100.0)),
      //                   // border: Border.all(
      //                   //   color: Colors.black, // ５パターンの色で回す
      //                   //   width: 1,
      //                   // ),
      //                   image: DecorationImage(
      //                       image: ExactAssetImage("images/logo.png"),
      //                       fit: BoxFit.contain
      //                   )
      //               ),
      //             ),
      //           ],
      //         ),
      //         SizedBox(
      //           height: 48.0,
      //         ),
      //         RoundedButton(
      //           buttonColor: Colors.lightBlueAccent,
      //           buttonTitle: "Log In",
      //           onPressed: () => {Navigator.pushNamed(context, LoginScreen.id)},
      //         ),
      //         RoundedButton(
      //           buttonColor: Colors.blueAccent,
      //           buttonTitle: "Register",
      //           // void initState() {
      //           //   super.initState();
      //           //   Firebase.initializeApp().whenComplete(() {
      //           //     print("completed");
      //           //     setState(() {});
      //           //   });
      //           // } //initState
      //           onPressed: () =>
      //           {Navigator.pushNamed(context, RegistrationScreen.id)},
      //         ),
      //       ]),
      // ),
    );
  }
}
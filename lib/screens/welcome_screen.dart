// import 'package:firebase_core/firebase_core.dart';
import 'package:digital_plan_test/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digital_plan_test/user_control/registration_screen.dart';
import 'package:digital_plan_test/user_control/login_screen.dart';
import 'package:digital_plan_test/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id =
      "welcome_screen"; // static宣言された変数は、宣言されたクラスに紐づいていることになる。。はず。。
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late AnimationController controller;
  late Animation animation;

  @override
  Widget build(BuildContext context) {
    Size size = Screen(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "アプリなんちゃら",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40, color: kSub4),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.01),
              Image(image: AssetImage("images/creativity.png"),),
              RoundedButton(
                buttonColor: kPrime,
                buttonTitle: "ログイン！",
                onPressed: () => {Navigator.pushNamed(context, LoginScreen.id)},
              ),
              RoundedButton(
                buttonColor: kSub4,
                buttonTitle: "とうろく！",
                onPressed: () =>
                    {Navigator.pushNamed(context, RegistrationScreen.id)},
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Material(
                        elevation: 5,
                        child: Image(image: AssetImage("images/Benesse_Logo.jpg"), width: logoSize, height: logoSize,)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Material(
                        elevation: 5,
                        child: Image(image: AssetImage("images/CoDMON_Logo.png"), width: logoSize, height: logoSize,)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Material(
                        elevation: 5,
                        child: Image(image: AssetImage("images/EDUCOM_Logo.jpg"), width: logoSize, height: logoSize,)
                    ),
                  ),Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Material(
                        elevation: 5,
                        child: Image(image: AssetImage("images/Classi_Home_Logo.png"), width: logoSize, height: logoSize,)
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
  double logoSize = 45;
}

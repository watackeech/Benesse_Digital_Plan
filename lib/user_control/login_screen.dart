import 'package:digital_plan_test/components/password_field.dart';
import 'package:digital_plan_test/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digital_plan_test/screens/home_screen.dart';
import 'package:digital_plan_test/components/rounded_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digital_plan_test/components/text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'registration_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  late String email, password;

  @override
  Widget build(BuildContext context) {
    Size size = Screen(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ModalProgressHUD(
          color: kPrime,
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                    onTap: (){ Navigator.pop(context); },
                    child: Image(image: AssetImage("images/creativity.png"), height: size.height*0.4,)
                ),
                SizedBox(height: size.height*0.05,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      height: size.height * 0.45,
                      decoration: BoxDecoration(
                        color: kSub3,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            TextInputField(
                              icon: FontAwesomeIcons.envelope,
                              hint: 'Email',
                              placeholder: "",
                              bgcolor: kSub1,
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                              onChanged: (value) {email = value;},
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            PasswordInput(
                              icon: FontAwesomeIcons.lock,
                              hint: 'Password',
                              bgcolor: kSub1,
                              inputType: TextInputType.visiblePassword,
                              inputAction: TextInputAction.done,
                              onChanged: (value) {password = value;},
                            ),
                            SizedBox(height: size.height*0.03,),
                            RoundedButton(
                              buttonColor: kPrime,
                              buttonTitle: "ログイン！",
                              onPressed: (){ LoginFirebase(); }
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<dynamic> LoginFirebase() async {
    setState(() {
      showSpinner = true;
    });
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.pushNamed(context, HomeScreen.id);
      setState(() {
        showSpinner = false;
      });
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('どっちか間違えてるかも！', textAlign: TextAlign.center,),
        ),
      );
    }
  }
}

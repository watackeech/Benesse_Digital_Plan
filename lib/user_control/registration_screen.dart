import 'package:digital_plan_test/components/password_field.dart';
import 'package:digital_plan_test/components/text_field.dart';
import 'package:digital_plan_test/palette.dart';
import 'package:digital_plan_test/user_control/add_user_details_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:digital_plan_test/components/rounded_button.dart';
// import 'package:digital_plan_test/screens/home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "registration_screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late bool showSpinner = false;
  late String email, password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = Screen(context);
    return Scaffold(
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
                        color: kSub2,
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
                              buttonColor: kSub4,
                              buttonTitle: "とうろく！",
                              onPressed: (){ RegistarFirebase(); }
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

  Future<dynamic> RegistarFirebase() async {
    setState(() {
      showSpinner = true;
    });
    print("register button is clicked!!");
    try {
      final newUser =
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        // Navigator.pushNamed(context, ChatScreen.id);
        Navigator.pushNamed(context, AddUserDetailsScreen.id);
        setState(() {
          showSpinner = false;
        });
      }
    } catch (e) {
      print("これはこまったーーーーーーーー");
      setState(() {
        showSpinner = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('もう登録済みかも！', textAlign: TextAlign.center,),
          action: SnackBarAction(
            label: 'Action',
            onPressed: () {
              // Code to execute.
            },
          ),
        ),
      );
      print(e);
    }
  }
}

import 'package:digital_plan_test/palette.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:digital_plan_test/screens/welcome_screen.dart';
import 'package:digital_plan_test/screens/survey_screen.dart';
import 'package:digital_plan_test/screens/home_screen.dart';
import 'package:digital_plan_test/user_control/registration_screen.dart';
import 'package:digital_plan_test/user_control/login_screen.dart';
import 'package:digital_plan_test/user_control/add_user_details_screen.dart';
import 'package:digital_plan_test/user_control/user_details_screen.dart';
import 'package:digital_plan_test/user_control/edit_user_details_screen.dart';
// テストたち
import 'package:digital_plan_test/screens/test_1_screen.dart';
import 'package:digital_plan_test/screens/test_2_screen.dart';
import 'package:digital_plan_test/screens/test_3_screen.dart';
import 'package:digital_plan_test/screens/test_4_screen.dart';

Future<void> main() async { //mainでinitializeApp()しておけば他でする必要がない
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BaseApp());
}

//https://storyset.com/ideaにattributeするの忘れずに

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue, //勝手にこの色でテーマ組んでくれる
          scaffoldBackgroundColor: kSub1,
          appBarTheme: AppBarTheme(color: kPrime, centerTitle: true,),
      ),
      home: WelcomeScreen(),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        AddUserDetailsScreen.id: (context) => AddUserDetailsScreen(),
        EditUserDetailsScreen.id: (context) => EditUserDetailsScreen(),
        UserDetailsScreen.id: (context) => UserDetailsScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        SurveyScreen.id: (context) => SurveyScreen(),
        Test1Screen.id: (context) => Test1Screen(),
        Test2Screen.id: (context) => Test2Screen(),
        Test3Screen.id: (context) => Test3Screen(),
        Test4Screen.id: (context) => Test4Screen(),
      },
    );
  }
}

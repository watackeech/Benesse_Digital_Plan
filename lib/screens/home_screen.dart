import 'package:digital_plan_test/palette.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digital_plan_test/user_control/user_details_screen.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//テストたち
import 'package:digital_plan_test/screens/test_1_screen.dart';
import 'package:digital_plan_test/screens/test_2_screen.dart';
import 'package:digital_plan_test/screens/test_3_screen.dart';
import 'package:digital_plan_test/screens/test_4_screen.dart';

final _firestore = FirebaseFirestore.instance;
late User? loggedInUser;

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      loggedInUser = user;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("ホーム画面"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: kPrime,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle, size: 35,),
            onPressed: () {
              Navigator.pushNamed(context, UserDetailsScreen.id);
            },
          ),
        ],
      ),
      floatingActionButton: FabCircularMenu(
          alignment: Alignment.bottomRight,
          ringDiameter: 500.0,
          ringWidth: 150.0,
          fabSize: 64.0,
          fabElevation: 8.0,
          fabIconBorder: CircleBorder(),
          fabColor: kPrime, //デフォの色
          fabOpenColor: kPrime, //開いた後の色
          ringColor: kPrime, //リングの色
          fabOpenIcon: Icon(Icons.menu, color: kSub1),
          fabCloseIcon: Icon(Icons.close, color: kSub1),
          fabMargin: const EdgeInsets.all(16.0),
          animationDuration: const Duration(milliseconds: 800),
          animationCurve: Curves.easeInOutCirc,
          children: <Widget>[
            IconButton(
                icon: FaIcon(FontAwesomeIcons.diceFour, color: kSub1, size: 50,),
                onPressed: () {
                  Navigator.pushNamed(context, Test4Screen.id);
                }),
            IconButton(
                icon: FaIcon(FontAwesomeIcons.diceThree, color: kSub1, size: 50,),
                onPressed: () {
                  Navigator.pushNamed(context, Test3Screen.id);
                }),
            IconButton(
                icon: FaIcon(FontAwesomeIcons.diceTwo, color: kSub1, size: 50,),
                onPressed: () {
                  Navigator.pushNamed(context, Test2Screen.id);
                }),
            IconButton(
                icon: FaIcon(FontAwesomeIcons.diceOne, color: kSub1, size: 50,),
                onPressed: () {
                  Navigator.pushNamed(context, Test1Screen.id);
                }),
          ]),
      body: SafeArea(
        child: FutureBuilder<DocumentSnapshot>(
          future: getUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("ようこそ！", style: TextStyle(fontSize: 30, color: kPrime),),
                      Text(
                        "${snapshot.data!["userName"]}さん",
                        style: TextStyle(fontSize: 30, color: kPrime),
                      ),
                    ],
                  ));
            } else if (snapshot.hasError) {
              return Text('エラーだよ！');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Future<DocumentSnapshot> getUserData() async {
    var currentUserEmail = loggedInUser!.email;
    // print("今のユーザーIDは、$currentUid です");
    var querySnapshot = await FirebaseFirestore.instance
        .collection("userDetails")
        .doc(currentUserEmail)
        .get();
    return querySnapshot; //QuerySnapshot(条件に一致したdocumentsの集まり)
  }
}

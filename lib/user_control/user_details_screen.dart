import 'package:digital_plan_test/palette.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_plan_test/components/rounded_button.dart';
import 'package:digital_plan_test/user_control/edit_user_details_screen.dart';
import 'package:digital_plan_test/screens/home_screen.dart';
import 'package:digital_plan_test/components/user_status_tile.dart';

// 参考 : https://qiita.com/kazuhideoki/items/ffe1b92aa17565ef8e4c

final _firestore = FirebaseFirestore.instance;
late User? loggedInUser;

class UserDetailsScreen extends StatefulWidget {
  static String id = "user_details_screen";
  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
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
        backgroundColor: kPrime,
        leading: IconButton(
          color: kSub1,
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Show Snackbar',
          onPressed: () {
            Navigator.pushNamed(context, HomeScreen.id);
          },
        ),
        title: Text("ユーザー詳細", style: TextStyle(color: kSub1),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<DocumentSnapshot>(
          future: getUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("${snapshot.data!["userName"]}がやってきた！");
              return Container(
                width: screen.width,
                height: screen.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    // Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
                    colors: <Color>[
                      kSub2, kSub3
                    ], // red to yellow
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: screen.height * 0.2,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 85.0),
                                  child: Center(
                                      child: Text(
                                    snapshot.data!["userName"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      UserStatusDesign(
                                          snapshot.data!["yourGrade"],
                                          "所属"),
                                      UserStatusDesign(
                                          snapshot.data!["hobby"], "趣味"),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                                  child: RoundedButton(
                                    buttonColor: kPrime,
                                    buttonTitle: "プロフィール修正！",
                                    onPressed: () => {
                                      Navigator.pushNamed(
                                          context, EditUserDetailsScreen.id)
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 280),
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60.0)),
                                border: Border.all(
                                  color: kPrime, // ５パターンの色で回す
                                  width: 3.0,
                                ),
                                image: DecorationImage(
                                    image: ExactAssetImage(
                                        "images/korasho.png"), //ユーザーアバター
                                    fit: BoxFit.contain)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('エラーだよ！');
              // return Center(child: CircularProgressIndicator());
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

//id指定ではなくwhereで取り出す場合
// Future<QuerySnapshot> getUserData() async {
//   String currentUid = FirebaseAuth.instance.currentUser!.uid;
//   // print("今のユーザーIDは、$currentUid です");
//   var querySnapshot = await FirebaseFirestore.instance
//       .collection("userDetails")
//       .where('uid', isEqualTo: currentUid)
//       .get();
//   return querySnapshot; //QuerySnapshot(条件に一致したdocumentsの集まり)
// }
}

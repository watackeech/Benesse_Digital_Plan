import 'package:digital_plan_test/components/dropdown_selector.dart';
import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digital_plan_test/user_control/user_details_screen.dart';
import 'package:digital_plan_test/components/rounded_button.dart';
import 'package:digital_plan_test/components/text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../palette.dart';

late User? loggedInUser;
final _firestore = FirebaseFirestore.instance;

class EditUserDetailsScreen extends StatefulWidget {
  static String id = "edit_user_details_screen";

  @override
  _EditUserDetailsScreenState createState() =>
      _EditUserDetailsScreenState();
}

class _EditUserDetailsScreenState extends State<EditUserDetailsScreen> {
  final _auth = FirebaseAuth.instance;
  String userName = "";
  String hobby = "";
  String yourGrade = "";
  late List<String> _grades = ["幼稚園・保育園", "小学校", "中学校", "高校", "大学", "社会人", "退職後"];

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
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

    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrime,
          centerTitle: true,
          title: Text(
            "プロフィール編集",
            style: TextStyle(
                fontSize: 20.0,
                color: kSub1,
                fontWeight: FontWeight.bold),
          )),
      body: SafeArea(
        child: FutureBuilder<DocumentSnapshot>(
          future: getUserData(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              String userName = snapshot.data!["userName"]; //変更がなかった場合に値が空のまま送信されるのを防ぐため
              String hobby = snapshot.data!["hobby"];
              String yourGrade = snapshot.data!["yourGrade"];
              return DirectSelectContainer(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        DropDownSelector( //スクロールして選択できるやつ
                            context, _grades, snapshot.data!["yourGrade"],
                            FontAwesomeIcons.school,
                                (item, index, context) {
                              print(item);
                              yourGrade = item;
                            }
                        ),
                        TextInputField(
                          icon: FontAwesomeIcons.user,
                          hint: '名前',
                          placeholder: snapshot.data!["userName"],
                          bgcolor: kPrime,
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          onChanged: (value) {userName = value;},
                        ),
                        TextInputField(
                          icon: FontAwesomeIcons.smile,
                          hint: '趣味',
                          placeholder: snapshot.data!["hobby"],
                          bgcolor: kPrime,
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          onChanged: (value) {hobby = value;},
                        ),
                        RoundedButton(
                            buttonColor: kSub3,
                            buttonTitle: "編集！！",
                            onPressed: () {
                              _firestore
                                  .collection("userDetails")
                                  .doc(loggedInUser!.email)
                                  .set({
                                // "uid": loggedInUser!.uid,
                                "userName": userName,
                                "yourGrade": yourGrade,
                                "hobby": hobby,
                              });
                              // Navigator.pushNamed(context, UserDetails.id);
                              Navigator.pushNamed(context, UserDetailsScreen.id);
                            })
                      ],
                    ),
                  ),
                ),
              );
            }else if (snapshot.hasError) {
              // return Text('エラーだよ！');
              //なぜかエラーが出るので、一秒待たせてから画面リロード
              Future.delayed(const Duration(seconds: 1), (){setState(() {});});
              return Center(child: CircularProgressIndicator());
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

import 'package:digital_plan_test/components/dropdown_selector.dart';
import 'package:digital_plan_test/components/text_field.dart';
import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_plan_test/components/rounded_button.dart';
import 'package:digital_plan_test/screens/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../palette.dart';

late User? loggedInUser;
final _firestore = FirebaseFirestore.instance;

class AddUserDetailsScreen extends StatefulWidget {
  static String id = "add_user_details_screen";
  @override
  _AddUserDetailsScreenState createState() => _AddUserDetailsScreenState();
}

class _AddUserDetailsScreenState extends State<AddUserDetailsScreen> {
  final _auth = FirebaseAuth.instance;
  String userName = "";
  String yourGrade = "中学校";
  late String hobby;
  late bool showSpinner = false;
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
      body: SafeArea(
        child: Center(
          child: DirectSelectContainer(
            child: ModalProgressHUD(
              color: kPrime,
              inAsyncCall: showSpinner,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  DropDownSelector(context, _grades, yourGrade, FontAwesomeIcons.school,
                      (item, index, context) {
                        print(item);
                        yourGrade = item;
                      }
                  ),
                  TextInputField(
                    icon: FontAwesomeIcons.user,
                    hint: '名前',
                    placeholder: "",
                    bgcolor: kPrime,
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    onChanged: (value) {userName = value;},
                  ),
                  TextInputField(
                    icon: FontAwesomeIcons.smile,
                    hint: '趣味',
                    placeholder: "",
                    bgcolor: kPrime,
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    onChanged: (value) {hobby = value;},
                  ),
                  RoundedButton(buttonColor: kSub3, buttonTitle: "登録！！", onPressed: (){
                    // print("$userName : $universityName : $comment : ${loggedInUser!.uid}");
                    _firestore.collection("userDetails").doc(loggedInUser!.email).set({ //docIDをメールアドレスに設定
                      // "uid": loggedInUser!.uid,
                      "userName": userName,
                      "yourGrade": yourGrade,
                      "hobby": hobby,
                    });
                    // Navigator.pushNamed(context, UserDetails.id);
                    Navigator.pushNamed(context, HomeScreen.id);
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  // DirectSelectItem<String> getDropDownMenuItem(String value, context) {
  //   Size size = MediaQuery.of(context).size;
  //   return DirectSelectItem<String>(
  //       itemHeight: size.height * 0.08,
  //       scaleFactor: 4,
  //       value: value,
  //       itemBuilder: (context, value) {
  //         return Text(value, style: TextStyle(color: kPrime, fontSize: 20),);
  //       });
  // }
  // _getDslDecoration() {
  //   return BoxDecoration(
  //     border: BorderDirectional(
  //       bottom: BorderSide(width: 1, color: kPrime),
  //       top: BorderSide(width: 1, color: kPrime),
  //     ),
  //   );
  // }
  // Widget DropDownSelector(context){
  //   Size size = MediaQuery.of(context).size;
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     verticalDirection: VerticalDirection.down,
  //     children: <Widget>[
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Column(
  //           children: <Widget>[
  //             Padding(
  //               padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
  //               child: Container(
  //                 width: size.width * 0.8,
  //                 decoration: BoxDecoration(
  //                   color: kPrime.withOpacity(0.5),
  //                   borderRadius: BorderRadius.circular(16),
  //                 ),
  //                 child: Row(
  //                   mainAxisSize: MainAxisSize.max,
  //                   children: <Widget>[
  //                     Padding(
  //                       padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
  //                       child: FaIcon(FontAwesomeIcons.school, size: 28, color: kPrime,),
  //                     ),
  //                     Expanded(
  //                         child: Padding(
  //                             child: DirectSelectList<String>(
  //                                 values: _grades,
  //                                 defaultItemIndex: 2,
  //                                 itemBuilder: (String value) => getDropDownMenuItem(value, context),
  //                                 focusedItemDecoration: _getDslDecoration(),
  //                                 onItemSelectedListener: (item, index, context) {
  //                                   print(item);
  //                                   yourGrade = item;
  //                                 }),
  //                             padding: EdgeInsets.only(left: 12))),
  //                     Padding(
  //                       padding: EdgeInsets.only(right: 8),
  //                       child: Icon(
  //                         Icons.unfold_more,
  //                         color: kPrime,
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}

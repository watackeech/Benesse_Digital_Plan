import 'package:flutter/material.dart';

class UserStatusDesign extends StatelessWidget {
  final String data;
  final String listTitle;
  UserStatusDesign(this.data, this.listTitle);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(listTitle, style: TextStyle(fontSize: 20),),
      trailing: Text(data, style: TextStyle(fontSize: 20),),
    );
  }
}
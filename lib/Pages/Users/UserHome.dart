import 'package:flutter/material.dart';
import 'package:agrokart/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {

  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser);
    print(whoIsTheUser);
    return Container(
      color: Colors.red,
    );
  }
}

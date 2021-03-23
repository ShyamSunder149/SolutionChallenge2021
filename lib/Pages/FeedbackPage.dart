import 'dart:ui';
import 'package:agrokart/Backend/Firebasee.dart';
import 'package:agrokart/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:agrokart/Backend/Firebasee.dart';

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  TextEditingController _feedback;
  @override
  void initState() {
    super.initState();
    _feedback = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.white.withOpacity(0.0),
        backgroundColor: Colors.white,
        title: Text(
          "Feedback",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
                color: Color(0xff309a20),
                fontSize: GFS(25, context),
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2.0),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    autocorrect: true,
                    controller: _feedback,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: "Please provide your valuable feedback...",
                        focusColor: Colors.grey,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none),
                    maxLines: 10,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: GFS(17, context)),
                    toolbarOptions: ToolbarOptions(
                        copy: true, paste: true, selectAll: true),
                    onSubmitted: (text) {
                      setState(() {
                        _feedback.text = text;
                      });
                    },
                  ),
                )),
            SizedBox(
              height: 30.0,
            ),
            MaterialButton(
              onPressed: () async {
                database.collection("Feedback").add({
                  "feedback": _feedback.text,
                  "Name": auth.currentUser.displayName,
                  "phoneNumber": auth.currentUser.phoneNumber,
                  "timestamp": FieldValue.serverTimestamp()
                });
                _feedback.text = "";
                _showpopUp(context);
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34.0),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xffcbf019),
                        const Color(0xff309a20)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 0.5,
                          blurRadius: 2.0,
                          offset: Offset(0.0, 5.0))
                    ]),
                child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: GFS(20, context),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _showpopUp(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          InkWell(
            onTap: () {
              if (whoIsTheUser == 'Farmer') {
                Navigator.popUntil(context, ModalRoute.withName('FarmerHome'));
              } else
                Navigator.popUntil(context, ModalRoute.withName('UserHome'));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text(
                "OK",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34.0),
                  gradient: LinearGradient(colors: [
                    const Color(0xffcbf019),
                    const Color(0xff309a20)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            ),
          )
        ],
        contentPadding: EdgeInsets.only(left: 20, right: 20, top: 20),
        content: Text("Thanks for submitting your valuable feedback"),
      ),
    );
  }
}

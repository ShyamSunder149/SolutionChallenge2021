import 'package:agrokart/Backend/Firebasee.dart';
import 'package:agrokart/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectYourRole extends StatefulWidget {
  @override
  _SelectYourRoleState createState() => _SelectYourRoleState();
}

class _SelectYourRoleState extends State<SelectYourRole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [const Color(0xffcbf019), const Color(0xff309a20)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Choose your side",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: GFS(30, context),
                        shadows: [
                          Shadow(
                              color: Colors.green[700],
                              blurRadius: 2.0,
                              offset: Offset(0, 5.0))
                        ],
                        fontWeight: FontWeight.w700),
                  ),
                )),
            Container(
              height: MediaQuery.of(context).size.width * 0.3,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      whoIsTheUser = "User";
                      auth.currentUser.updateProfile(displayName: auth.currentUser.displayName+"-User");
                      Navigator.pushNamed(context, 'UserHome');
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.3,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.green[700],
                                blurRadius: 2.0,
                                offset: Offset(0, 5.0))
                          ]),
                      child: Center(
                          child: Text(
                        "User",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: GFS(20, context),
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        whoIsTheUser = "Farmer";
                        auth.currentUser.updateProfile(displayName: auth.currentUser.displayName+"-Farmer");
                      });
                      Navigator.pushNamed(context, 'FarmerHome');
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.3,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.indigo[700],
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.green[700],
                                blurRadius: 2.0,
                                offset: Offset(2.0, 5.0))
                          ]),
                      child: Center(
                          child: Text(
                        "Farmer",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: GFS(20, context),
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ])),
    );
  }
}

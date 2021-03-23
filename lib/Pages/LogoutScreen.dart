import 'package:agrokart/Backend/Firebasee.dart';
import 'package:agrokart/Pages/SignInPage.dart';
import 'package:agrokart/main.dart';
import 'package:flutter/material.dart';
import 'package:agrokart/Pages/SignInPage.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xffcbf019), const Color(0xff309a20)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: AlertDialog(
        title: Text(
          "Logout",
          style: TextStyle(
              color: Colors.black,
              fontSize: GFS(20, context),
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700),
        ),
        content: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Column(
            children: [
              Container(
                child: Text(
                  "Are you sure that you want to logout?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: GFS(15, context),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () {
                          auth.signOut();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Login()),
                              (Route<dynamic> route) => false);
                        },
                        child: Container(
                          width: GFS(50, context),
                          height: GFS(30, context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              "YES",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: GFS(15, context),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: GFS(50, context),
                          height: GFS(30, context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              "NO",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: GFS(15, context),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

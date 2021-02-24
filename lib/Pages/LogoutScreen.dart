import 'package:agrokart/Pages/SignInPage.dart';
import 'package:agrokart/main.dart';
import 'package:flutter/material.dart';
import 'package:agrokart/Pages/SignInPage.dart';
class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: AlertDialog(
        title:
        Text("Logout", style: TextStyle(
            color: Colors.black,
            fontSize: GFS(20, context),
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700
        ),
        ),
        content: Container(
          height: MediaQuery.of(context).size.height*0.1,
          child: Column(
            children: [
              Container(
                child: Text("Are you sure that you want to logout?", style: TextStyle(
                    color: Colors.black,
                    fontSize: GFS(15, context),
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500
                ),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => Login()),(Route<dynamic> route) => false);
                        },
                      child: Text("Yes", style: TextStyle(
                          color: Colors.red,
                          fontSize: GFS(20, context),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700
                      ),),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                    InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Text("No", style: TextStyle(
                          color: Colors.green[700],
                          fontSize: GFS(20, context),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700
                      ),),
                    ),
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
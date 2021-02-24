import 'package:agrokart/main.dart';
import 'package:flutter/material.dart';
class SelectYourRole extends StatefulWidget {
  @override
  _SelectYourRoleState createState() => _SelectYourRoleState();
}

class _SelectYourRoleState extends State<SelectYourRole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  whoIsTheUser = "normal";
                });
                Navigator.pushNamed(context, 'UserHome');},
              child: Container(
                height: MediaQuery.of(context).size.width*0.3,
                width:  MediaQuery.of(context).size.width*0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [BoxShadow(color: Colors.black,spreadRadius: 0.5,blurRadius: 2.0,offset: Offset(1.0,2.0))]
                ),
                child: Center(child: Text("User",style: TextStyle(
                  fontSize: GFS(20, context),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700
                ),),),

              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  whoIsTheUser = "Farmer";
                });
                Navigator.pushNamed(context, 'FarmerHome');},
              child: Container(
                height: MediaQuery.of(context).size.width*0.3,
                width:  MediaQuery.of(context).size.width*0.3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [BoxShadow(color: Colors.black,spreadRadius: 0.5,blurRadius: 2.0,offset: Offset(1.0,2.0))]
                ),
                child: Center(child: Text("Farmer",style: TextStyle(
                    fontSize: GFS(20, context),
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700
                ),),),

              ),
            )
          ],
        ),
      ),
    );
  }
}

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
      backgroundColor: Colors.blue,
      body: Container(

        alignment: Alignment.center,
        child:Column(
          children:[

             Center(


               child: Container(
                 padding: EdgeInsets.fromLTRB(20, 275, 20, 50),
                 child:Text("Choose your side....",style: TextStyle(
                     fontSize: 25,
                     fontFamily: "Roboto",
                     color: Colors.white
                 ),),

        )
             ),
          Row(
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
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20.0),

                  ),
                  child: Center(child: Text("User",style: TextStyle(
                      fontSize: GFS(20, context),
                      fontFamily: "Roboto",

                    color: Colors.white
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
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20.0),

                  ),
                  child: Center(child: Text("Farmer",style: TextStyle(
                      fontSize: GFS(20, context),
                      fontFamily: "Roboto",

                    color: Colors.white
                  ),),),

                ),
              )
            ],
          ),]

        )


      ),
    );
  }
}



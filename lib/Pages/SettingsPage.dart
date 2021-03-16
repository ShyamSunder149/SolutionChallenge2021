import 'package:agrokart/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.white.withOpacity(0.0),
        backgroundColor: Colors.white,
        title: Text("Settings",
          style: GoogleFonts.roboto(textStyle:TextStyle(
            color:  Color(0xff309a20),
            fontSize: GFS(25, context),
            fontWeight: FontWeight.w700
          ),),
        ),
      ),
      body: Container(
        child: ListView.separated(
            itemBuilder: (context,index) => SizedBox(
              height: MediaQuery.of(context).size.height*0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left:20.0),
                    child: Text("Feedback",
                style: GoogleFonts.roboto(textStyle:TextStyle(
                      color: Colors.black,
                      fontSize: GFS(17, context),
                      fontWeight: FontWeight.w700
                ),),
              ),
                  ),
              Padding(
                padding: EdgeInsets.only(right:20.0),
                child: IconButton(icon:Icon(Icons.keyboard_arrow_right_sharp,color: Colors.black),onPressed:(){
                  Navigator.pushNamed(context, "feedback");
                }),
              )
            ]
              )
            ),
            separatorBuilder: (context,index) => Divider(),
            itemCount: 1),

      ),
    );
  }
}

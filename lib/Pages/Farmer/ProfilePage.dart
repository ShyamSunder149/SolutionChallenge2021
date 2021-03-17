import 'package:agrokart/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FarmerProfile extends StatefulWidget {
  @override
  _FarmerProfileState createState() => _FarmerProfileState();
}

class _FarmerProfileState extends State<FarmerProfile> {
  TextEditingController controllerName;
  TextEditingController controllerEmail;
  TextEditingController controllerMobile;
  TextEditingController controllerDOB;
  @override
  void initState() {
    super.initState();
    controllerName = TextEditingController(text: 'Sudharsan');
    controllerDOB = TextEditingController(text: '123435');
    controllerEmail = TextEditingController(text: 'ANJ APT ,TRICHY -6201012');
    controllerMobile = TextEditingController(text: '9843700596');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white.withOpacity(0.0),
        backgroundColor: Colors.white,
        title: Text("Profile",
          style: GoogleFonts.roboto(textStyle:TextStyle(
            color:  Color(0xff309a20),
            fontSize: GFS(25, context),
          ),),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.35,
              child: Container(
                height: MediaQuery.of(context).size.width * 0.6 * 0.5,
                width: MediaQuery.of(context).size.width * 0.6 * 0.5,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle),
                child: Icon(Icons.person,color: Colors.white,size:MediaQuery.of(context).size.width * 0.6 * 0.2 ,),
              ),

            ),
            Container(
              child: ListView(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                              MediaQuery.of(context).size.width * 0.07,
                              vertical: 8.0),
                          child: TextField(
                            focusNode: FocusNode(
                                canRequestFocus: false,
                                descendantsAreFocusable: false),
                            controller: controllerName,
                            decoration: InputDecoration(
                              labelText: "NAME",
                              focusColor: Colors.grey,
                              hoverColor: Colors.grey,
                              fillColor: Colors.grey,
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize:GFS(14, context)),
                              contentPadding: EdgeInsets.zero,
                            ),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize:
                                GFS(17, context)),
                            maxLines: 1,
                            toolbarOptions: ToolbarOptions(
                                copy: true, paste: true, selectAll: true),
                            onSubmitted: (text) {
                              setState(() {
                                controllerName.text = text;
                              });
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                              MediaQuery.of(context).size.width * 0.07,
                              vertical: 8.0),
                          child: TextField(
                            controller: controllerEmail,
                            decoration: InputDecoration(
                              labelText: "ADDRESS",
                              focusColor: Colors.grey,
                              hoverColor: Colors.grey,
                              fillColor: Colors.grey,
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: GFS(14, context)),
                              contentPadding: EdgeInsets.zero,
                            ),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize:
                                GFS(17, context)),
                            toolbarOptions: ToolbarOptions(
                                copy: true, paste: true, selectAll: true),
                            onSubmitted: (text) {
                              setState(() {
                                controllerEmail.text = text;
                              });
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                              MediaQuery.of(context).size.width * 0.07,
                              vertical: 8.0),
                          child: TextField(
                            controller: controllerMobile,
                            decoration: InputDecoration(
                              labelText: "MOBILE",
                              focusColor: Colors.grey,
                              hoverColor: Colors.grey,
                              fillColor: Colors.grey,
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize:GFS(14, context)),
                              contentPadding: EdgeInsets.zero,
                            ),
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize:
                                GFS(17, context)),
                            maxLines: 1,
                            toolbarOptions: ToolbarOptions(
                                copy: true, paste: true, selectAll: true),
                            onSubmitted: (text) {
                              setState(() {
                                controllerMobile.text = text;
                              });
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                              MediaQuery.of(context).size.width * 0.07,
                              vertical: 8.0),
                          child: TextField(
                            readOnly: true,
                            keyboardType: TextInputType.datetime,
                            controller: controllerDOB,
                            decoration: InputDecoration(
                              labelText: "DATE OF BIRTH",
                              focusColor: Colors.grey,
                              hoverColor: Colors.grey,
                              fillColor: Colors.grey,
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: GFS(14, context)),
                              contentPadding: EdgeInsets.zero,
                            ),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize:
                                GFS(17, context)),
                            maxLines: 1,
                            toolbarOptions: ToolbarOptions(
                                copy: true, paste: true, selectAll: true),
                            onSubmitted: (text) {
                              setState(() {
                                controllerDOB.text = text;
                              });
                            },
                          )),
                    ],
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

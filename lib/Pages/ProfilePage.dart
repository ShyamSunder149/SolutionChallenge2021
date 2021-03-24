import 'package:agrokart/Backend/Firebasee.dart';
import 'package:agrokart/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FarmerProfile extends StatefulWidget {
  @override
  _FarmerProfileState createState() => _FarmerProfileState();
}

class _FarmerProfileState extends State<FarmerProfile> {
  TextEditingController controllerName,
      controllerAddress,
      controllerMobile,
      controllerDOB;
  @override
  void initState() {
    super.initState();
    database
        .collection("Users")
        .doc(auth.currentUser.phoneNumber)
        .get()
        .then((value) {
      setState(() {
        controllerName = TextEditingController(
            text: value.data()["Name"].toString().split("-")[0]);
        controllerDOB = TextEditingController(text: value.data()["DOB"]);
        controllerAddress =
            TextEditingController(text: value.data()["Address"]);
        controllerMobile =
            TextEditingController(text: auth.currentUser.phoneNumber);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white.withOpacity(0.0),
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Color(0xff309a20),
              fontSize: GFS(25, context),
            ),
          ),
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
                decoration:
                    BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width * 0.6 * 0.2,
                ),
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
                                  fontSize: GFS(14, context)),
                              contentPadding: EdgeInsets.zero,
                            ),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: GFS(17, context)),
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
                            controller: controllerAddress,
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
                                fontSize: GFS(17, context)),
                            toolbarOptions: ToolbarOptions(
                                copy: true, paste: true, selectAll: true),
                            onSubmitted: (text) {
                              setState(() {
                                controllerAddress.text = text;
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
                            controller: controllerMobile,
                            decoration: InputDecoration(
                              labelText: "MOBILE",
                              focusColor: Colors.grey,
                              hoverColor: Colors.grey,
                              fillColor: Colors.grey,
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: GFS(14, context)),
                              contentPadding: EdgeInsets.zero,
                            ),
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: GFS(17, context)),
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
                                fontSize: GFS(17, context)),
                            maxLines: 1,
                            toolbarOptions: ToolbarOptions(
                                copy: true, paste: true, selectAll: true),
                            onSubmitted: (text) {
                              setState(() {
                                controllerDOB.text = text;
                              });
                            },
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                        width: MediaQuery.of(context).size.width,
                      ),
                      MaterialButton(
                        onPressed: () {
                          auth.currentUser.updateProfile(
                              displayName: (auth.currentUser.displayName
                                      .contains("Farmer"))
                                  ? controllerName.text + "-Farmer"
                                  : controllerName.text + "-User");
                          database
                              .collection("Users")
                              .doc(auth.currentUser.phoneNumber)
                              .set({
                            "Phone": auth.currentUser.phoneNumber,
                            "Name": auth.currentUser.displayName,
                            "Address": controllerAddress.text,
                            "DOB": controllerDOB.text
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.3,
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
              ]),
            )
          ],
        ),
      ),
    );
  }
}

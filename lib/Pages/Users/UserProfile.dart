import 'package:agrokart/main.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController controllerName;
  TextEditingController controllerEmail;
  TextEditingController controllerMobile;
  TextEditingController controllerDOB;
  @override
  void initState() {
    super.initState();
    controllerName = TextEditingController(text: 'Sudharsan');
    controllerDOB = TextEditingController(text: '123435');
    controllerEmail = TextEditingController(text: 'sudhar01sd@gmail.com');
    controllerMobile = TextEditingController(text: '9843700596');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        excludeHeaderSemantics: true,
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17),
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
                    color: Colors.purple,
                    shape: BoxShape.circle),
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
                            readOnly: true,
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
                            readOnly: true,
                            controller: controllerEmail,
                            decoration: InputDecoration(
                              labelText: "E-MAIL",
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
                            readOnly: true,
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
                            keyboardType: TextInputType.datetime,
                            controller: controllerDOB,
                            decoration: InputDecoration(
                              suffixIcon: Container(
                                  height: 20.0,
                                  width: 20.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 10.0,
                                  )),
                              suffixIconConstraints: BoxConstraints(
                                  maxWidth: 50.0, maxHeight: 50.0),
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

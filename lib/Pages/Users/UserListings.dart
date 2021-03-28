import 'package:flutter/material.dart';
import 'package:agrokart/Backend/Firebasee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agrokart/main.dart';

class UserListings extends StatefulWidget {
  @override
  _UserListingsState createState() => _UserListingsState();
}

class _UserListingsState extends State<UserListings> {
  var _listings;
  @override
  void initState() {
    super.initState();
    _listings = database.collection("Listings").snapshots();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white.withOpacity(0.0),
        backgroundColor: Colors.white,
        title: Text(
          "Listings",
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
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: StreamBuilder(
                stream: _listings,
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  else
                    return ListView.separated(
                        itemCount: snapshot.data.docs.length,
                        separatorBuilder: (context, int index) => Divider(),
                        itemBuilder: (context, int index) => Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          shadowColor: Colors.black54,
                          elevation: 5.0,
                          child: ExpansionTile(
                            childrenPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1),
                            expandedAlignment: Alignment.centerLeft,
                            expandedCrossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(text: TextSpan(children:
                              [
                                TextSpan(text:"Name:            ",
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.blue,
                                            fontSize: GFS(15, context),
                                            fontWeight: FontWeight.w700))),
                                TextSpan(text:snapshot.data.docs[index]["Name"].toString().split("-")[0],
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.green,
                                            fontSize: GFS(15, context),
                                            fontWeight: FontWeight.w700))),

                              ])),
                              SizedBox(height: 5.0,),
                              RichText(text: TextSpan(children:
                              [
                                TextSpan(
                                  text:"Contact:        ",
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.blue,
                                      fontSize: GFS(15, context),
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text:snapshot.data.docs[index]["phoneNumber"],
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.green,
                                      fontSize: GFS(15, context),
                                    ),
                                  ),
                                )
                              ])),
                              SizedBox(height: 5.0,),
                              RichText(text: TextSpan(children:
                              [
                                TextSpan(
                                  text:"Stock:            ",
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.blue,
                                      fontSize: GFS(15, context),
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text:snapshot.data.docs[index]
                                  ["Available Stock"],
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.green,
                                      fontSize: GFS(15, context),
                                    ),
                                  ),
                                )

                              ])),
                              SizedBox(height: 5.0,),
                              RichText(text: TextSpan(children:
                              [
                                TextSpan(
                                  text:"Description:  ",
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.blue,
                                      fontSize: GFS(15, context),
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text:snapshot.data.docs[index]
                                  ["Description"],
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.green,
                                      fontSize: GFS(15, context),
                                    ),
                                  ),
                                )

                              ])),
                              SizedBox(height: 5.0,),


                            ],
                            leading: CircleAvatar(
                              backgroundColor: Colors.lightGreenAccent,
                            ),
                            title: Text(
                              snapshot.data.docs[index]["Crop"],
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Colors.lightGreenAccent[700],
                                    fontSize: GFS(17, context),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            subtitle: SizedBox(
                              //width: MediaQuery.of(context).size.width*0.5,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Price :",
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Colors.blue,
                                              fontSize: GFS(12, context),
                                              fontWeight:
                                              FontWeight.w700))),
                                  Text(snapshot.data.docs[index]["Price"],
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Colors.green,
                                              fontSize: GFS(12, context),
                                              fontWeight:
                                              FontWeight.w700))),

                                ],
                              ),
                            ),
                          ),
                        ));
                }),
          ),
        ),
      ),
    );
  }
}

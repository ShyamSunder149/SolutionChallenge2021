import 'package:agrokart/Backend/Firebasee.dart';
import 'package:agrokart/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FarmerHomePage extends StatefulWidget {
  @override
  _FarmerHomePageState createState() => _FarmerHomePageState();
}

class _FarmerHomePageState extends State<FarmerHomePage> {
  final GlobalKey<ScaffoldState> homePage = GlobalKey();
  var _listings;
  final List<Map<String, dynamic>> sideBar = [
    {
      "title": "Profile",
      "icon": Icon(
        Icons.person,
        color: Colors.white,
      ),
      "route": "FarmerProfilePage"
    },
    {
      "title": "Listings",
      "icon": Icon(
        Icons.list_alt,
        color: Colors.white,
      ),
      "route": "ListingsPage"
    },
    {
      "title": "FeedBack",
      "icon": Icon(
        Icons.feedback_rounded,
        color: Colors.white,
      ),
      "route": "feedback"
    },
    {
      "title": "Logout",
      "icon": Icon(
        Icons.logout,
        color: Colors.white,
      ),
      "route": "LogoutScreen"
    }
  ];
  @override
  void initState() {
    _listings = database.collection("Listings").snapshots();
    super.initState();
    if (auth.currentUser != null) {
      database
          .collection("Users")
          .doc(auth.currentUser.phoneNumber)
          .get()
          .then((value) {
        if (value.exists != true) {
          database.collection("Users").doc(auth.currentUser.phoneNumber).set({
            "Phone": auth.currentUser.phoneNumber,
            "Name": auth.currentUser.displayName
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.white.withOpacity(0.0),
          backgroundColor: Colors.white,
          title: Text(
            "Home",
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                color: Color(0xff309a20),
                fontSize: GFS(25, context),
              ),
            ),
          ),
        ),
        drawer: Drawer(
          key: homePage,
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                const Color(0xffcbf019),
                const Color(0xff309a20)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text("AgroMart",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Color(0xff309a20),
                              fontSize: GFS(35, context),
                              fontWeight: FontWeight.w700,
                              shadows: [
                                Shadow(
                                    color: Colors.black26,
                                    blurRadius: 2.0,
                                    offset: Offset(0.0, 5.0))
                              ]),
                        )),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView.separated(
                        itemBuilder: (context, int index) => ListTile(
                            leading: sideBar[index]['icon'],
                            title: Text(sideBar[index]["title"],
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: GFS(20, context),
                                      fontWeight: FontWeight.w700),
                                )),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, sideBar[index]["route"]);
                            }),
                        separatorBuilder: (context, int index) => Divider(
                              color: Colors.white,
                              thickness: 1.0,
                            ),
                        itemCount: sideBar.length),
                  ),
                ],
              )),
        ),
        body: Container(
          child: StreamBuilder(
              stream: _listings,
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());
                else
                  return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.075,),
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.2,
                              width: MediaQuery.of(context).size.width*0.85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(34.0),
                                  gradient: LinearGradient(
                                      colors: [const Color(0xffcbf019), const Color(0xff309a20)],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight
                                  )

                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width*0.7,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("25 c",
                                            style: GoogleFonts.roboto(textStyle:TextStyle(
                                              color: Colors.white,
                                              fontSize: GFS(22, context),

                                            ),),
                                          ),
                                          IconButton(icon: Icon(Icons.notifications_none,color: Colors.white,), onPressed: () => null)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width*0.7,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(snapshot.data.docs[0]["Crop"].toString().split("-")[0],
                                            style: GoogleFonts.roboto(textStyle:TextStyle(
                                                color: Colors.white,
                                                fontSize: GFS(30, context),
                                                fontWeight: FontWeight.w700

                                            ),),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width*0.15,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                                boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 2.0,spreadRadius: 1.0,offset: Offset(2.0,2.0))]
                                            ),
                                            child:
                                            Center(
                                              child: SvgPicture.string(
                                                svg_wk70q0,

                                              ),
                                            ),
                                          )
                                          //IconButton(icon: Icon(Icons.power_settings_new,color:  Color(0xff309a20),), onPressed: () => null))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width*0.7,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.cloud,color: Colors.white,),
                                          Icon(Icons.bug_report_sharp,color: Colors.white,),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*0.7*0.4,
                                          ),
                                          Icon(Icons.history,color: Colors.white,),
                                          Text(" - 19 days",
                                            style: GoogleFonts.roboto(textStyle:TextStyle(
                                              fontStyle: FontStyle.italic,
                                              color:  Colors.white,
                                              fontSize: GFS(17, context),
                                            ),),

                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.1 ),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width*0.8,
                              child: Text(
                                "What's Next ?",
                                style: GoogleFonts.roboto(textStyle:TextStyle(
                                    color:  Color(0xff309a20),
                                    fontSize: GFS(17, context),
                                    fontWeight: FontWeight.w700
                                ),),

                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.075 ),
                            child: Container(
                                height: MediaQuery.of(context).size.height*0.55,
                                width: MediaQuery.of(context).size.width*0.85,
                                child:  ListView.separated(
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
                                    ))
                            ),
                          ),
                        ],
                      )
                  );
              }
          )
        ));
  }
}

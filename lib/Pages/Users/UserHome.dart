import 'package:flutter/material.dart';
import 'package:agrokart/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final GlobalKey<ScaffoldState> userHomePage = GlobalKey();
  final List<Map<String,dynamic>> sideBar = [
    {
      "title": "Profile",
      "icon": Icon(Icons.person,color: Colors.white,),
      "route": "UserProfilePage"
    },
    {
      "title": "Listings",
      "icon": Icon(Icons.list_alt,color: Colors.white,),
      "route": "ListingsPage"
    },
    {
      "title": "Settings",
      "icon": Icon(Icons.settings,color: Colors.white,),
      "route": "SettingsPage"
    },
    {
      "title": "Logout",
      "icon": Icon(Icons.logout,color: Colors.white,),
      "route": "LogoutScreen"
    }
  ];

  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser);
    print(whoIsTheUser);
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.white.withOpacity(0.0),
          backgroundColor: Colors.white,
          title: Text("Home",
            style: GoogleFonts.roboto(textStyle:TextStyle(
              color:  Color(0xff309a20),
              fontSize: GFS(25, context),
            ),),
          ),
        ),
        drawer: Drawer(
          key: userHomePage,
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [const Color(0xffcbf019), const Color(0xff309a20)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                  )

              ),

              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width*0.1,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                        "AgroMart",style: GoogleFonts.roboto(
                      textStyle:TextStyle(
                          color:   Color(0xff309a20),
                          fontSize: GFS(35, context),
                          fontWeight: FontWeight.w700
                      ),
                    )
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.7,
                    child: ListView.separated(
                        itemBuilder: (context,int index) =>
                            ListTile(
                              leading: sideBar[index]['icon'],
                              title: Text(
                                  sideBar[index]["title"],style: GoogleFonts.roboto(
                                textStyle:TextStyle(
                                    color: Colors.white,
                                    fontSize: GFS(20, context),
                                    fontWeight: FontWeight.w700
                                ),
                              )

                              ),
                              onTap: () => Navigator.pushNamed(context, sideBar[index]["route"]),
                            ),
                        separatorBuilder:(context, int index) => Divider(color: Colors.white,thickness: 1.0,),
                        itemCount: sideBar.length),
                  ),
                ],
              )
          ),
        ),
        body:Container(
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
                              Text("Ground Nut ",
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
                  child: ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (context, int index) => Divider(),
                      itemBuilder: (context,int index) =>
                          Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                            shadowColor: Colors.black54,
                            elevation: 5.0,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.lightGreenAccent,
                              ),
                              title: Text("Paddy",
                                style: GoogleFonts.roboto(textStyle:TextStyle(
                                    color: Colors.green,
                                    fontSize: GFS(17, context),
                                    fontWeight: FontWeight.w700
                                ),),

                              ),
                              subtitle: SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Sales :",
                                        style: GoogleFonts.roboto(textStyle:TextStyle(
                                            color: Colors.blue,
                                            fontSize: GFS(12, context),
                                            fontWeight: FontWeight.w700
                                        )
                                        )
                                    ),
                                    Text(" + 26 ",
                                        style: GoogleFonts.roboto(textStyle:TextStyle(
                                            color: Colors.green,
                                            fontSize: GFS(12, context),
                                            fontWeight: FontWeight.w700
                                        )
                                        )
                                    ),
                                    SizedBox(
                                        width:MediaQuery.of(context).size.width*0.85*0.2
                                    ),
                                    Icon(Icons.history,color: Colors.blue,),
                                    Text(" - 19 days",
                                      style: GoogleFonts.roboto(textStyle:TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color:  Colors.blue,
                                        fontSize: GFS(12, context),
                                      ),),

                                    )


                                  ],

                                ),

                              ),
                            ),
                          )
                    // Container(
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15.0),
                    //       gradient: LinearGradient(
                    //           colors: [const Color(0xffcbf019), const Color(0xff309a20)],
                    //           begin: Alignment.topLeft,
                    //           end: Alignment.bottomRight
                    //       )
                    //
                    //   ),
                    //   height: MediaQuery.of(context).size.width*0.17,
                    //   child: Center(
                    //     child: Text("Paddy",
                    //       style: GoogleFonts.roboto(textStyle:TextStyle(
                    //           color: Colors.white,
                    //           fontSize: GFS(17, context),
                    //           fontWeight: FontWeight.w700
                    //       ),),
                    //
                    //     ),
                    //   ),
                    // )
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}

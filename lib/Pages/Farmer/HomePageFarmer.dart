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
  final List<Map<String,dynamic>> sideBar = [
    {
      "title": "Profile",
      "icon": Icon(Icons.person,color: Colors.white,),
      "route": "FarmerProfilePage"
    },
    {
      "title": "Listings",
      "icon": Icon(Icons.list_alt,color: Colors.white,),
      "route": "ListingsPage"
    },
    {
      "title": "FeedBack",
      "icon": Icon(Icons.feedback_rounded,color: Colors.white,),
      "route": "feedback"
    },
    {
      "title": "Logout",
      "icon": Icon(Icons.logout,color: Colors.white,),
      "route": "LogoutScreen"
    }
  ];
  @override
  Widget build(BuildContext context) {
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
        key: homePage,
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
      // body: Stack(
      //   children: <Widget>[
      //     Transform.translate(
      //       offset: Offset(115.4, 729.0),
      //       child: SizedBox(
      //         width: 145.0,
      //         child: Text(
      //           'Farmer\'s friend',
      //           style: TextStyle(
      //             fontFamily: 'Segoe UI',
      //             fontSize: 20,
      //             color: const Color(0xffffffff),
      //           ),
      //           textAlign: TextAlign.center,
      //         ),
      //       ),
      //     ),
      //     Transform.translate(
      //       offset: Offset(38.0, 98.0),
      //       child: Container(
      //         width: 300.0,
      //         height: 156.0,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(35.0),
      //           gradient: LinearGradient(
      //             begin: Alignment(-0.85, -0.69),
      //             end: Alignment(0.93, 0.81),
      //             colors: [const Color(0xffcbf019), const Color(0xff309a20)],
      //             stops: [0.0, 1.0],
      //           ),
      //         ),
      //       ),
      //     ),
      //     Transform.translate(
      //       offset: Offset(72.0, 219.0),
      //       child: SvgPicture.string(
      //         _svg_9jlfqb,
      //         allowDrawingOutsideViewBox: true,
      //       ),
      //     ),
      //     Transform.translate(
      //       offset: Offset(254.0, 143.0),
      //       child: SizedBox(
      //         width: 67.0,
      //         height: 67.0,
      //         child: Stack(
      //           children: <Widget>[
      //            Container(
      //                 decoration: BoxDecoration(
      //                   borderRadius:
      //                   BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
      //                   color: const Color(0xffffffff),
      //                   boxShadow: [
      //                     BoxShadow(
      //                       color: const Color(0x29000000),
      //                       offset: Offset(0, 3),
      //                       blurRadius: 6,
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               SvgPicture.string(
      //                 _svg_wk70q0,
      //                 allowDrawingOutsideViewBox: true,
      //                 fit: BoxFit.fill,
      //               ),
      //           ]
      //         ),
      //       ),
      //     ),
      //     Transform.translate(
      //       offset: Offset(59.5, 111.0),
      //       child: SizedBox(
      //         width: 43.0,
      //         child: Text(
      //           '25°',
      //           style: TextStyle(
      //             fontFamily: 'Segoe UI',
      //             fontSize: 22,
      //             color: const Color(0xffffffff),
      //           ),
      //           textAlign: TextAlign.center,
      //         ),
      //       ),
      //     ),
      //     Transform.translate(
      //       offset: Offset(51.1, 156.0),
      //       child: SizedBox(
      //         width: 196.0,
      //         child: Text(
      //           'Ground Nut',
      //           style: TextStyle(
      //             fontFamily: 'Open Sans',
      //             fontSize: 30,
      //             color: const Color(0xffffffff),
      //             fontWeight: FontWeight.w700,
      //           ),
      //           textAlign: TextAlign.center,
      //         ),
      //       ),
      //     ),
      //     Transform.translate(
      //       offset: Offset(241.0, 35.0),
      //       child: SvgPicture.string(
      //         _svg_k5q9ud,
      //         allowDrawingOutsideViewBox: true,
      //       ),
      //     ),
      //     Transform.translate(
      //       offset: Offset(257.3, 219.0),
      //       child: SizedBox(
      //         width: 68.0,
      //         child: Text(
      //           '- 19 days',
      //           style: TextStyle(
      //             fontFamily: 'Open Sans',
      //             fontSize: 15,
      //             color: const Color(0xffffffff),
      //             fontStyle: FontStyle.italic,
      //           ),
      //           textAlign: TextAlign.center,
      //         ),
      //       ),
      //     ),
      //     Transform.translate(
      //       offset: Offset(112.0, 119.0),
      //       child: SvgPicture.string(
      //         _svg_q03kvr,
      //         allowDrawingOutsideViewBox: true,
      //       ),
      //     ),
      //     Transform.translate(
      //       offset: Offset(33.1, 274.0),
      //       child: SizedBox(
      //         width: 108.0,
      //         child: Text(
      //           'What\'s Next ?',
      //           style: TextStyle(
      //             fontFamily: 'Open Sans',
      //             fontSize: 15,
      //             color: const Color(0xff3ea21f),
      //             fontWeight: FontWeight.w600,
      //           ),
      //           textAlign: TextAlign.center,
      //         ),
      //       ),
      //     ),
      //     Transform.translate(
      //       offset: Offset(38.0, 316.0),
      //       child: Container(
      //         width: 300.0,
      //         height: 419.0,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(20.0),
      //           color: const Color(0xffffffff),
      //           border: Border.all(width: 1.0, color: const Color(0xff707070)),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
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












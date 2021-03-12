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
      "route": " "
    },
    {
      "title": "Settings",
      "icon": Icon(Icons.settings,color: Colors.white,),
      "route": " "
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

          child: ListView.separated(
              itemBuilder: (context,int index) =>
              ListTile(
                leading: sideBar[index]['icon'],
                title: Text(
                  sideBar[index]["title"],style: TextStyle(
                    color: Colors.white,
                    fontSize: GFS(20, context),
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700
                ),

                ),
                onTap: () => Navigator.pushNamed(context, sideBar[index]["route"]),
              ),
              separatorBuilder:(context, int index) => Divider(color: Colors.white,thickness: 1.0,),
              itemCount: sideBar.length)
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
                                    _svg_wk70q0,

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
                          shadowColor: Colors.black54,
                          elevation: 5.0,
                          child: ListTile(
                            tileColor: Colors.white,
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

const String _svg_wk70q0 =
    '<svg viewBox="265.7 155.2 21.2 24.2" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ffcbf019"  /><stop offset="1.0" stop-color="#ff309a20"  /></linearGradient></defs><path transform="translate(261.25, 153.25)" d="M 18.1083812713623 5.391593933105469 L 18.1083812713623 8.60399055480957 C 18.96385192871094 8.977404594421387 19.75051689147949 9.511489868164063 20.43038558959961 10.19130992889404 C 21.85849952697754 11.61937713623047 22.64492988586426 13.51811218261719 22.64492988586426 15.53767967224121 C 22.64492988586426 17.55724716186523 21.85845375061035 19.45598030090332 20.43038558959961 20.88404846191406 C 19.00231742858887 22.31211853027344 17.1036548614502 23.09859275817871 15.08401489257813 23.09859275817871 C 13.06437492370605 23.09859275817871 11.16573715209961 22.3121166229248 9.737668991088867 20.88404846191406 C 8.309600830078125 19.45598220825195 7.523100852966309 17.55724716186523 7.523100852966309 15.53767967224121 C 7.523100852966309 13.51811218261719 8.309577941894531 11.61937713623047 9.737645149230957 10.19130992889404 C 10.41751384735107 9.511441230773926 11.20417976379395 8.977356910705566 12.05964946746826 8.60394287109375 L 12.05964946746826 5.391593933105469 C 7.687361717224121 6.693016529083252 4.498735427856445 10.74264240264893 4.498735427856445 15.53767967224121 C 4.498735427856445 21.3837776184082 9.237963676452637 26.12295913696289 15.08401489257813 26.12295913696289 C 20.93011474609375 26.12295913696289 25.66929626464844 21.3837776184082 25.66929626464844 15.53767967224121 C 25.66929626464844 10.74264144897461 22.48071670532227 6.693016529083252 18.1083812713623 5.391593933105469 Z M 13.57183265686035 1.928033590316772 L 16.59619903564453 1.928033590316772 L 16.59619903564453 14.02549648284912 L 13.57183265686035 14.02549648284912 L 13.57183265686035 1.928033590316772 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_9jlfqb =
    '<svg viewBox="72.0 219.0 27.0 24.0" ><path transform="translate(72.0, 219.0)" d="M 16.4296875 10.5703125 C 16.10624885559082 8.82656192779541 14.58750057220459 7.5 12.75 7.5 C 12.17343807220459 7.5 11.62968730926514 7.640625 11.14218807220459 7.875 C 10.32656288146973 6.745312690734863 9.004687309265137 6 7.5 6 C 5.015625 6 3 8.015625 3 10.5 C 3 10.5234375 3.009374856948853 10.55156230926514 3.009374856948853 10.57499980926514 C 1.293749928474426 10.91718769073486 0 12.43125057220459 0 14.25 C 0 16.32187461853027 1.678125023841858 18 3.75 18 L 15.75 18 C 17.82187461853027 18 19.5 16.32187461853027 19.5 14.25 C 19.5 12.41249942779541 18.17812538146973 10.88906192779541 16.4296875 10.5703125 Z M 26.62031364440918 10.49062442779541 C 23.3203125 11.11406230926514 20.29218864440918 8.6015625 20.29218864440918 5.296874523162842 C 20.29218864440918 3.393749713897705 21.31875038146973 1.640624642372131 22.98750114440918 0.6984370350837708 C 23.24531364440918 0.5531245470046997 23.1796875 0.1640620678663254 22.88906288146973 0.1124995499849319 C 22.48124885559082 0.03749999776482582 22.06406211853027 0 21.64687538146973 0 C 17.99531364440918 0 15.03281402587891 2.868749856948853 14.87812519073486 6.464062690734863 C 16.12968826293945 7.02187442779541 17.13750076293945 8.04843807220459 17.63906288146973 9.356249809265137 C 19.37812614440918 10.02656173706055 20.63906288146973 11.578125 20.92968940734863 13.42499828338623 C 21.16875076293945 13.44843578338623 21.3984375 13.49531078338623 21.64218902587891 13.49531078338623 C 23.73750114440918 13.49531078338623 25.65468788146973 12.54843616485596 26.92031288146973 10.99687480926514 C 27.1171875 10.77187442779541 26.91093826293945 10.43437480926514 26.62031364440918 10.49062442779541 Z M 17.0859375 19.59843635559082 C 16.72968864440918 19.39687538146973 16.27031135559082 19.51406288146973 16.06406211853027 19.87968635559082 L 14.34843730926514 22.87968635559082 C 14.14218807220459 23.24062347412109 14.26875019073486 23.6953125 14.62968730926514 23.90156364440918 C 14.74687480926514 23.96718788146973 14.87343788146973 24 15.00000190734863 24 C 15.25781440734863 24 15.5109395980835 23.86406135559082 15.6515645980835 23.62031364440918 L 17.36718940734863 20.62031364440918 C 17.56875038146973 20.25937461853027 17.44687652587891 19.8046875 17.08593940734863 19.59843826293945 Z M 12.5859375 19.59843635559082 C 12.22968769073486 19.39687538146973 11.77031230926514 19.51406288146973 11.56406307220459 19.87968635559082 L 9.848437309265137 22.87968635559082 C 9.64218807220459 23.24062347412109 9.768750190734863 23.6953125 10.12968730926514 23.90156364440918 C 10.24687480926514 23.96718788146973 10.37343788146973 24 10.5 24 C 10.7578125 24 11.01093769073486 23.86406135559082 11.15156269073486 23.62031364440918 L 12.8671875 20.62031364440918 C 13.06875038146973 20.25937461853027 12.94687557220459 19.8046875 12.5859375 19.59843826293945 Z M 8.0859375 19.59843635559082 C 7.729687690734863 19.39687538146973 7.270312786102295 19.51406288146973 7.064062595367432 19.87968635559082 L 5.348437786102295 22.87968635559082 C 5.142187595367432 23.24062347412109 5.268750190734863 23.6953125 5.629687786102295 23.90156364440918 C 5.746875286102295 23.96718788146973 5.873437881469727 24 6 24 C 6.2578125 24 6.510937690734863 23.86406135559082 6.651562690734863 23.62031364440918 L 8.3671875 20.62031364440918 C 8.56874942779541 20.25937461853027 8.44687557220459 19.8046875 8.0859375 19.59843826293945 Z M 3.5859375 19.59843635559082 C 3.229687213897705 19.39687538146973 2.770312547683716 19.51406288146973 2.564062356948853 19.87968635559082 L 0.8484374284744263 22.87968635559082 C 0.6421874761581421 23.24062347412109 0.7687499523162842 23.6953125 1.129687428474426 23.90156364440918 C 1.246874928474426 23.96718788146973 1.373437404632568 24 1.5 24 C 1.7578125 24 2.010937452316284 23.86406135559082 2.151562452316284 23.62031364440918 L 3.8671875 20.62031364440918 C 4.068749904632568 20.25937461853027 3.946875095367432 19.8046875 3.5859375 19.59843826293945 Z" fill="#ffffff" fill-opacity="0.75" stroke="none" stroke-width="1" stroke-opacity="0.75" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_k5q9ud =
    '<svg viewBox="241.0 35.0 80.0 203.0" ><path transform="translate(289.5, 26.0)" d="M 2.5 24 L 31.5 24 L 31.5 27 L 4.5 27 L 2.5 24 Z M 4.5 16.5 L 31.5 16.5 L 31.5 19.5 L 4.5 19.5 L 4.5 16.5 Z M 4.5 9 L 31.5 9 L 31.5 12 L 4.5 12 L 4.5 9 Z" fill="#3ea21f" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(238.0, 220.0)" d="M 10.5 18 C 6.357998847961426 18 2.999999761581421 14.64249801635742 2.999999761581421 10.5 C 2.999999761581421 6.357499122619629 6.357998847961426 2.999999761581421 10.5 2.999999761581421 C 14.64200019836426 2.999999761581421 18 6.357998847961426 18 10.5 C 18 14.64200019836426 14.64200019836426 18 10.5 18 Z M 16.5 10.5 C 16.5 7.186290740966797 13.81370830535889 4.499999523162842 10.5 4.499999523162842 C 7.186290740966797 4.499999523162842 4.499999523162842 7.186291694641113 4.499999523162842 10.5 C 4.499999523162842 13.8137092590332 7.186291694641113 16.5 10.5 16.5 C 13.8137092590332 16.5 16.5 13.81370830535889 16.5 10.5 Z M 13.5 9.749999046325684 C 13.91421318054199 9.749999046325684 14.25 10.08578586578369 14.25 10.5 C 14.25 10.91421222686768 13.91421318054199 11.25 13.5 11.25 L 11.25 11.25 C 10.42499923706055 11.25 9.749999046325684 10.57499885559082 9.749999046325684 9.749999046325684 L 9.749999046325684 6.75 C 9.749999046325684 6.335785865783691 10.08578586578369 5.999999523162842 10.5 5.999999523162842 C 10.91421222686768 5.999999523162842 11.25 6.335785865783691 11.25 6.75 L 11.25 9.749999046325684 L 13.5 9.749999046325684 Z" fill="#ffffff" fill-opacity="0.75" stroke="none" stroke-width="1" stroke-opacity="0.75" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_q03kvr =
    '<svg viewBox="112.0 119.0 209.0 120.0" ><path transform="translate(303.0, 116.0)" d="M 14.25 15 L 14.25 15.75 C 14.25 16.99264144897461 13.24264144897461 18 12 18 C 10.75735855102539 18 9.75 16.99264144897461 9.75 15.75 L 9.75 15 L 6.75 15 C 6.337499618530273 15 6 14.66250038146973 6 14.25 C 6 13.83749961853027 6.337499618530273 13.5 6.75 13.5 L 7.5 13.5 L 7.5 9 C 7.5 6.805021286010742 9.084262847900391 4.929612636566162 11.24918460845947 4.562637329101563 L 11.25 3.75 C 11.25 3.335785865783691 11.58578681945801 3 12 3 C 12.41421318054199 3 12.75 3.335785865783691 12.75 3.75 L 12.75 4.561999797821045 C 14.87849807739258 4.918999671936035 16.5 6.770000457763672 16.5 8.999499320983887 L 16.5 13.4995002746582 L 17.25 13.4995002746582 C 17.66249847412109 13.4995002746582 18 13.83699989318848 18 14.2495002746582 C 18 14.66200065612793 17.66249847412109 14.9995002746582 17.25 14.9995002746582 L 14.25 14.9995002746582 Z M 9 13.5 L 15 13.5 L 15 9 C 15 7.343144416809082 13.6568546295166 6 12 6 C 10.34314441680908 6 9 7.343145370483398 9 9 L 9 13.5 Z M 12 16.5 C 12.41421318054199 16.5 12.75 16.16421318054199 12.75 15.75 L 12.75 15 L 11.25 15 L 11.25 15.75 C 11.25 16.16421318054199 11.58578681945801 16.5 12 16.5 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(107.5, 219.5)" d="M 7.000048160552979 14.50042343139648 L 5.333349227905273 14.50042343139648 C 4.873103141784668 14.50042343139648 4.5 14.12732028961182 4.5 13.66707420349121 C 4.5 13.20682907104492 4.873103141784668 12.83372497558594 5.333349227905273 12.83372497558594 L 7.000048160552979 12.83372497558594 L 7.000048160552979 11.71925926208496 C 6.705318450927734 11.80963897705078 6.384770393371582 11.72992992401123 6.166698932647705 11.51203441619873 L 4.988342761993408 10.33367729187012 C 4.662810325622559 10.00832271575928 4.662810325622559 9.48067569732666 4.988253593444824 9.155232429504395 C 5.31369686126709 8.829789161682129 5.841344833374023 8.829789161682129 6.166787624359131 9.155232429504395 L 7.113383769989014 10.10200595855713 C 7.399603366851807 8.791481018066406 8.199790954589844 7.650643825531006 9.334537506103516 6.93527889251709 L 8.32174015045166 5.923591613769531 C 7.996192932128906 5.598197937011719 7.996068477630615 5.07050609588623 8.321462631225586 4.744958400726318 C 8.646856307983398 4.419410705566406 9.174549102783203 4.419285774230957 9.500096321105957 4.744680404663086 L 11.01901435852051 6.26304292678833 C 11.66656303405762 6.134139060974121 12.33316993713379 6.134139060974121 12.9807186126709 6.263042449951172 L 14.50019264221191 4.744680404663086 C 14.82554626464844 4.419148921966553 15.35319519042969 4.419148445129395 15.67863845825195 4.74459171295166 C 16.00408172607422 5.070034503936768 16.00408172607422 5.597681999206543 15.67863845825195 5.923125267028809 L 14.66686248779297 6.93583345413208 C 15.80160903930664 7.651199817657471 16.60179710388184 8.792037010192871 16.88801574707031 10.10256099700928 L 17.83358955383301 9.154766082763672 C 18.15913772583008 8.829371452331543 18.68683052062988 8.829496383666992 19.01222229003906 9.15504264831543 C 19.33761787414551 9.4805908203125 19.33749389648438 10.00828266143799 19.0119457244873 10.3336763381958 L 17.83358955383301 11.51203346252441 C 17.61575317382813 11.73032379150391 17.29517364501953 11.81046867370605 17.00024032592773 11.72037029266357 L 17.00024032592773 12.83372497558594 L 18.66694068908691 12.83372497558594 C 19.1271858215332 12.83372497558594 19.50028991699219 13.20682907104492 19.50028991699219 13.66707420349121 C 19.50028991699219 14.12732028961182 19.1271858215332 14.50042343139648 18.66694068908691 14.50042343139648 L 17.00024032592773 14.50042343139648 C 17.00024032592773 14.90265274047852 16.95246124267578 15.2943286895752 16.86301612854004 15.67044544219971 C 17.18525886535645 15.50439929962158 17.577880859375 15.56571960449219 17.83414649963379 15.82211589813232 L 19.0119457244873 17.00047302246094 C 19.33747863769531 17.32582664489746 19.33747863769531 17.85347366333008 19.01203536987305 18.17891693115234 C 18.68659400939941 18.50436019897461 18.15894508361816 18.50436019897461 17.8335018157959 18.17891693115234 L 16.65523338317871 17.00047302246094 C 16.57831573486328 16.923828125 16.51716232299805 16.83285140991211 16.47522926330566 16.73268890380859 C 15.62886619567871 18.42905807495117 13.89592933654785 19.50087738037109 12.00014495849609 19.50052070617676 C 10.10341644287109 19.50052070617676 8.37067985534668 18.42837524414063 7.524637699127197 16.73184585571289 C 7.482926845550537 16.832275390625 7.421913146972656 16.92354202270508 7.345055103302002 17.00047302246094 L 6.166698932647705 18.1788272857666 C 5.841343879699707 18.50436019897461 5.313696384429932 18.50436019897461 4.988253593444824 18.17891693115234 C 4.662810325622559 17.85347366333008 4.662810325622559 17.32582664489746 4.988254070281982 17.00038146972656 L 6.166698932647705 15.82211589813232 C 6.422965049743652 15.56571960449219 6.815586090087891 15.50439929962158 7.137829303741455 15.67044544219971 C 7.046078681945801 15.28720951080322 6.999832630157471 14.89449214935303 7.00004768371582 14.5004243850708 Z M 15.22854042053223 10.33367729187012 L 8.771749496459961 10.33367729187012 C 9.153009414672852 8.862634658813477 10.48050117492676 7.835339069366455 12.00014495849609 7.835339069366455 C 13.51978874206543 7.835339069366455 14.8472785949707 8.862635612487793 15.22854042053223 10.3336763381958 Z M 15.22854042053223 15.33377265930176 C 14.8472785949707 16.80481338500977 13.51978874206543 17.83210754394531 12.00014495849609 17.83210754394531 C 10.48050117492676 17.83210754394531 9.153009414672852 16.80481338500977 8.771749496459961 15.33377265930176 L 15.22854042053223 15.33377265930176 Z" fill="#ffffff" fill-opacity="0.75" stroke="none" stroke-width="1" stroke-opacity="0.75" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';













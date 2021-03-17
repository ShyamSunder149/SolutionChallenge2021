import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agrokart/main.dart';
class ListingsPage extends StatefulWidget {
  @override
  _ListingsPageState createState() => _ListingsPageState();
}

class _ListingsPageState extends State<ListingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.green,
        child: Icon(Icons.add,color: Colors.white,),
      ),
      appBar: AppBar(
        shadowColor: Colors.white.withOpacity(0.0),
        backgroundColor: Colors.white,
        title: Text("Listings",
          style: GoogleFonts.roboto(textStyle:TextStyle(
            color:  Color(0xff309a20),
            fontSize: GFS(25, context),
          ),),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top:10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.9,
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
        ),
      ),
    );
  }
}
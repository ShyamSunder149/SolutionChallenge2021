import 'package:agrokart/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  TextEditingController _feedback;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _feedback = TextEditingController(text: " ");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.white.withOpacity(0.0),
        backgroundColor: Colors.white,
        title: Text("Feedback",
          style: GoogleFonts.roboto(textStyle:TextStyle(
              color:  Color(0xff309a20),
              fontSize: GFS(25, context),
              fontWeight: FontWeight.w700
          ),),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.3,
              width: MediaQuery.of(context).size.width*0.9,
              child: TextField(
                controller: _feedback,
                decoration: InputDecoration(
                  hintText: "Give your feedback here...",
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
                    _feedback.text = text;
                  });
                },
              )
            ),
           MaterialButton(
             onPressed: () async{
               _feedback.text = "";
               _showpopUp(context);


           },
             child: Text("Submit"),
           )
          ],
        ),
      ),


    );
  }
  _showpopUp(BuildContext context) async{
    await showDialog(context: context,
        builder: (context) =>
         AlertDialog(
           actions: [
             InkWell(
               onTap: () => Navigator.popUntil(context,ModalRoute.withName('SettingsPage')),

               child: Container(
                 height:  MediaQuery.of(context).size.height*0.05,
                 width:  MediaQuery.of(context).size.width,
                 alignment: Alignment.center,
                 child: Text("ok"),
                 color: Colors.greenAccent,
    ),
             )
           ],
           contentPadding: EdgeInsets.only(left: 20,right: 20,top: 20),
           content: Text("Thanks for submitting your valuable feedback"),
         ),


    );
  }


}

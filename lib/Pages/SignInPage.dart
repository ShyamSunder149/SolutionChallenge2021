import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:agrokart/main.dart';
import 'package:agrokart/Backend/Firebasee.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginKey = GlobalKey<ScaffoldState>();
  int iter;
  final SnackBar snackBar = SnackBar(content: Text("Invalid username or password"),duration: Duration(seconds: 2),backgroundColor: Colors.red,);
  TextEditingController _nameController;
  TextEditingController _numberController;
  TextEditingController _verificationNumber;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: '');
    _numberController = TextEditingController();
    _verificationNumber = TextEditingController();
    iter = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: loginKey,
        body:Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [const Color(0xffcbf019), const Color(0xff309a20)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              )
          )
              ),  ///background
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Agromart",style:GoogleFonts.montserrat(textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: GFS(60, context),
                          color: Colors.white,
                        shadows: [Shadow(color: Colors.green[700],blurRadius: 2.0,offset: Offset(0,5.0))]
                      )
                      ),),
                    ),  ///title
                    SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                    Container(
                      height: MediaQuery.of(context).size.height*0.06,
                      width: MediaQuery.of(context).size.width*0.85,
                      decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.circular(50.0),
                          boxShadow: [BoxShadow(color: Colors.black26,spreadRadius: 1.0,blurRadius: 4.0,offset: Offset(2.0,4.0))]
                      ),
                      child: TextField(
                        controller: _numberController,
                        style: TextStyle(
                          color: Colors.black,
                        ),

                        decoration: InputDecoration(
                            focusColor: Colors.black,
                            prefixIcon: Icon(Icons.phone ,color: Theme.of(context).primaryColor,),
                            hintText: 'Mobile Number',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintStyle: TextStyle(
                                color: Colors.black26,
                                fontSize: GFS(20, context)
                            )
                        ),
                        keyboardType: TextInputType.numberWithOptions(),
                        onSubmitted: (text) {
                          setState(() {
                            _numberController.text = "+91" + text;
                            number = "+91" + text;


                          });
                        },

                      ),
                    ),   ///Number

                    SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                    Container(
                      height: MediaQuery.of(context).size.height*0.06,
                      width: MediaQuery.of(context).size.width*0.85,
                      decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.circular(50.0),
                          boxShadow: [BoxShadow(color: Colors.black26,spreadRadius: 1.0,blurRadius: 4.0,offset: Offset(2.0,4.0))]
                      ),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        controller: _nameController,
                        decoration: InputDecoration(
                            focusColor: Colors.black,
                            prefixIcon: Icon(Icons.lock_open_outlined,color: Theme.of(context).primaryColor,),
                            hintText: 'Name',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintStyle: TextStyle(
                                color: Colors.black26,
                                fontSize: GFS(20, context)
                            )
                        ),
                        onSubmitted: (text) {
                          setState(() {
                            _nameController .text = text;


                          });
                        },

                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'ChooseYourRole');
                       // auth.verifyPhoneNumber(
                       //     phoneNumber: _numberController.text,
                       //     timeout: Duration(seconds: 60),
                       //     verificationCompleted: (PhoneAuthCredential phoneAuth){
                       //       print("smscode : ${phoneAuth.smsCode} provider Id: ${phoneAuth.providerId}  verificationId: ${phoneAuth.verificationId} ");
                       //       print("User verified _____");
                       //       auth.signInWithCredential(phoneAuth).then((value) {
                       //         value.user.updateProfile(displayName: _nameController.text);
                       //         Navigator.pushNamed(context, 'ChooseYourRole');
                       //       });
                       //     },
                       //     verificationFailed: (FirebaseAuthException exception){
                       //       print("_____________$exception");
                       //       SnackBar(key:loginKey,content: Text("Verification Failed...Please retry"),duration: Duration(seconds: 2),backgroundColor: Colors.red,);
                       //     },
                       //     codeSent: (String verifyId,int token1){
                       //       print("________verify : $verifyId ____token : $token1");
                       //     },
                       //     codeAutoRetrievalTimeout: (String status) {
                       //       print("codeAutoRetrievalTimeout:  $status");
                       //     });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.07,
                        width: MediaQuery.of(context).size.width*0.4,
                        decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: [BoxShadow(color: Colors.black26,spreadRadius: 0.5,blurRadius: 2.0,offset: Offset(1.0,5.0))]
                        ),
                        child: Center(
                          child: Text("Sign In" ,
                            style: GoogleFonts.montserrat(textStyle:TextStyle(
                                color: Colors.green,
                                fontSize: GFS(20, context),
                              fontWeight: FontWeight.w700

                            ),
                          ),
                          )
                        ),

                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.05,),

                    // InkWell(
                    //   onTap: () {
                    //     final AuthCredential credential = PhoneAuthProvider.credential(
                    //       verificationId: _verificationNumber.,
                    //       smsCode: _smsController.text,
                    //     );
                    //
                    //     final User user = (await _auth.signInWithCredential(credential)).user;
                    //   },
                    //   child: Container(
                    //     height: MediaQuery.of(context).size.height*0.07,
                    //     width: MediaQuery.of(context).size.width*0.4,
                    //     decoration: BoxDecoration(
                    //         color: Theme.of(context).primaryColor,
                    //         borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                    //         boxShadow: [BoxShadow(color: Colors.black54,spreadRadius: 1.0,blurRadius: 4.0,offset: Offset(2.0,4.0))]
                    //     ),
                    //     child: Center(
                    //       child: Text("Login" ,
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: GFS(20, context),
                    //             fontWeight: FontWeight.w600
                    //         ),
                    //       ),
                    //     ),
                    //
                    //   ),
                    // )
                  ],
                ),
              ),  ///foreground
            ],
          ),
        )


    );
  }
}


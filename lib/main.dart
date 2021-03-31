import 'package:agrokart/Pages/Farmer/AddListingsPage.dart';
import 'package:agrokart/Pages/Farmer/HomePageFarmer.dart';
import 'package:agrokart/Pages/ProfilePage.dart';
import 'package:agrokart/Pages/FeedbackPage.dart';
import 'package:agrokart/Pages/Farmer/FarmerListings.dart';
import 'package:agrokart/Pages/LogoutScreen.dart';
import 'package:agrokart/Pages/ProfilePage.dart';
import 'package:agrokart/Pages/SelectFarmerorUser.dart';
import 'package:agrokart/Pages/SignInPage.dart';
import 'package:agrokart/Pages/Users/UserListings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:agrokart/Pages/Users/HomePageUser.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgroKart',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     initialRoute: (FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser.phoneNumber != null)?(FirebaseAuth.instance.currentUser.displayName.contains("Farmer"))?'FarmerHome':"UserHome":'LoginSection',
    // initialRoute: 'LoginSection',
      routes: {
        'LogoutScreen':(context) => LogoutScreen(),
        'FarmerProfilePage': (context) => FarmerProfile(),
        'LoginSection': (context) => Login(),
        'FarmerHome': (context) => FarmerHomePage(),
        'ChooseYourRole': (context) => SelectYourRole(),
        'UserHome' : (context) => UserHomePage(),
        'ListingsPage':(context) => ListingsPage(),
        "UserListingPage":(context) => UserListings(),
        "feedback":(context) => FeedbackForm(),
        'AddListings' : (context) => AddListings(),
        "ProfilePage":(context) => FarmerProfile(),
      },

    );
  }
}



double GFS(double i,BuildContext context){
  return (MediaQuery.of(context).size.width *
      MediaQuery.of(context).devicePixelRatio) < 1080
      ? (i * 1.5) / (MediaQuery.of(context).devicePixelRatio)
      : (MediaQuery.of(context).size.width *
      MediaQuery.of(context).devicePixelRatio) > 1080
      ? (i * 3) / (MediaQuery.of(context).devicePixelRatio)
      : (i * 2.5) / (MediaQuery.of(context).devicePixelRatio);

}

String number = '';
String name = '';


String whoIsTheUser = '';


const String svg_wk70q0 =
    '<svg viewBox="265.7 155.2 21.2 24.2" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ffcbf019"  /><stop offset="1.0" stop-color="#ff309a20"  /></linearGradient></defs><path transform="translate(261.25, 153.25)" d="M 18.1083812713623 5.391593933105469 L 18.1083812713623 8.60399055480957 C 18.96385192871094 8.977404594421387 19.75051689147949 9.511489868164063 20.43038558959961 10.19130992889404 C 21.85849952697754 11.61937713623047 22.64492988586426 13.51811218261719 22.64492988586426 15.53767967224121 C 22.64492988586426 17.55724716186523 21.85845375061035 19.45598030090332 20.43038558959961 20.88404846191406 C 19.00231742858887 22.31211853027344 17.1036548614502 23.09859275817871 15.08401489257813 23.09859275817871 C 13.06437492370605 23.09859275817871 11.16573715209961 22.3121166229248 9.737668991088867 20.88404846191406 C 8.309600830078125 19.45598220825195 7.523100852966309 17.55724716186523 7.523100852966309 15.53767967224121 C 7.523100852966309 13.51811218261719 8.309577941894531 11.61937713623047 9.737645149230957 10.19130992889404 C 10.41751384735107 9.511441230773926 11.20417976379395 8.977356910705566 12.05964946746826 8.60394287109375 L 12.05964946746826 5.391593933105469 C 7.687361717224121 6.693016529083252 4.498735427856445 10.74264240264893 4.498735427856445 15.53767967224121 C 4.498735427856445 21.3837776184082 9.237963676452637 26.12295913696289 15.08401489257813 26.12295913696289 C 20.93011474609375 26.12295913696289 25.66929626464844 21.3837776184082 25.66929626464844 15.53767967224121 C 25.66929626464844 10.74264144897461 22.48071670532227 6.693016529083252 18.1083812713623 5.391593933105469 Z M 13.57183265686035 1.928033590316772 L 16.59619903564453 1.928033590316772 L 16.59619903564453 14.02549648284912 L 13.57183265686035 14.02549648284912 L 13.57183265686035 1.928033590316772 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';


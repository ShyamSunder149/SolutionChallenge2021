import 'package:agrokart/Pages/Farmer/HomePageFarmer.dart';
import 'package:agrokart/Pages/SelectFarmerorUser.dart';
import 'package:agrokart/Pages/SignInPage.dart';
import 'package:agrokart/Pages/Users/UserHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
     //initialRoute: (FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser.phoneNumber != null)?(whoIsTheUser == "Farmer")?'FarmerHome':"UserHome":'LoginSection',
     initialRoute: 'LoginSection',
      routes: {
        'LaunchScreen': (context) = Launch(),
        'LoginSection': (context) => Login(),
        'FarmerHome': (context) => FarmerHomePage(),
        'ChooseYourRole': (context) => SelectYourRole(),
        'UserHome' : (context) => UserHomePage()
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

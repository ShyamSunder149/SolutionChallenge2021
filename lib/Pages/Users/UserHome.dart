import 'package:flutter/material.dart';
import 'package:agrokart/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    print(FirebaseAuth.instance.currentUser);
    print(whoIsTheUser);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("Home",style: TextStyle(
            color: Colors.white,
            fontSize: GFS(25, context),
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700
        ),),
      ),
      drawer: Drawer(
        key: userHomePage,
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width*0.1,
            color: Colors.green[700],
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.lightGreenAccent,
      ),
    );
  }
}

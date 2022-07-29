// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_unnecessary_containers, non_constant_identifier_names, no_logic_in_create_state
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/profile.dart';
import 'package:flutter_auth/Screens/Home/quiz_home.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/services/auth_serv.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required String accesstoken}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final Auth_serv Auth = Auth_serv();
  //final Widget child;
  HomeState({
    Key? key,
    //required this.child,
    this.topImage = "assets/images/main_top.png",
  });

  final String topImage;
  @override
  Widget build(BuildContext context) {
    Auth_serv _auth = Auth_serv();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  topImage,
                  width: 120,
                ),
              ),
              //SafeArea(child: Drawer),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 164, 145, 233),
          title: const Text(
            'Dashboard',
          ),
        ),
        // appBar:AppBar(
        //     backgroundColor: Colors.transparent,
        //     elevation: 0,
        //     toolbarHeight: 10,
        //   ),
        // backgroundColor: Color.fromARGB(255, 144, 76, 207),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 135, 97, 185)),
                accountName: Text(
                  "user",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  "user@example.com",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 300,
                  child: Text(
                    "U",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'RobotoMono-Bold',
                        fontSize: 70,
                        color: Color.fromARGB(255, 111, 53, 165)),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                iconColor: Color.fromARGB(255, 111, 53, 165),
                title: const Text('Profile'),
                textColor: Color.fromARGB(255, 111, 53, 165),
                onTap: () async {
                  //Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfilePage();
                  }));
                },
              ),
              ListTile(
                leading: Icon(Icons.edit_calendar_rounded),
                iconColor: Color.fromARGB(255, 111, 53, 165),
                title: const Text('Attend Test'),
                textColor: Color.fromARGB(255, 111, 53, 165),
                onTap: () {
                  //Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return quizHome();
                  }));
                },
              ),
              ListTile(
                leading: Icon(Icons.flag),
                iconColor: Color.fromARGB(255, 111, 53, 165),
                title: const Text('Report Problem'),
                textColor: Color.fromARGB(255, 111, 53, 165),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              AboutListTile(
                // <-- SEE HERE
                icon:
                    Icon(Icons.info, color: Color.fromARGB(255, 111, 53, 165)),

                applicationIcon: Icon(Icons.local_play,
                    color: Color.fromARGB(255, 111, 53, 165)),
                applicationName: 'QRoom',
                applicationVersion: '1.0',
                applicationLegalese: 'Developed on 2022',
                aboutBoxChildren: [
                  ///Content goes here...
                ],
                child: Text(
                  'About app',
                  style: TextStyle(color: Color.fromARGB(255, 111, 53, 165)),
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                iconColor: Color.fromARGB(255, 111, 53, 165),
                title: const Text('Sign Out'),
                textColor: Color.fromARGB(255, 111, 53, 165),
                onTap: () async {
                  dynamic result = FirebaseAuth.instance.signOut();
                  if (result != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ));
  }
}

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    this.topImage = "assets/images/main_top.png",
    this.bottomImage = "assets/images/login_bottom.png",
  }) : super(key: key);

  final String topImage, bottomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                topImage,
                width: 120,
              ),
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}

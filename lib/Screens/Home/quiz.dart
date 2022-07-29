import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/quiz_widget.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/services/auth_serv.dart';
import 'package:flutter_auth/widgets/appbar_widget.dart';

class quizGen extends StatefulWidget {
  quizGen({Key? key}) : super(key: key);

  @override
  State<quizGen> createState() => _quizGenState();
}

class _quizGenState extends State<quizGen> {
  final Auth_serv Auth = Auth_serv();
  //final Widget child;
  _quizGenState({
    Key? key,
    //required this.child,
    this.topImage = "assets/images/main_top.png",
  });
  final String topImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('question').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  width: 350.0,
                  height: 800.0,
                  child: Center(
                    child: Text(
                      document['qstn'],
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 162, 67, 242)),
                    ),
                  ));
            }).toList(),
          );
        },
      ),

      // body: Scaffold(
      //   body: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //   ),

      //   // SizedBox(height: defaultPadding / 2,
      //   //  constraints: BoxConstraints(
      //   //         maxHeight: 700,
      //   //         maxWidth: 350,
      //   //       ),),
      // ),
    );
  }
}

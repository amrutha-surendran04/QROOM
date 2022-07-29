// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_auth/widgets/appbar_widget.dart';

// class quizWidget extends StatefulWidget {
//   const quizWidget({Key? key}) : super(key: key);

//   @override
//   State<quizWidget> createState() => _quizWidgetState();
// }

// class _quizWidgetState extends State<quizWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(context),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('question').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           return ListView(
//             children: snapshot.data!.docs.map((document) {
//               return Container(
//                   color: Color.fromARGB(255, 255, 255, 255),
//                   //width: 350.0,
//                   //height: 800.0,
//                   child: Center(
//                     child: Text(
//                       document['qstn'],
//                       style: TextStyle(
//                           fontSize: 15,
//                           color: Color.fromARGB(255, 162, 67, 242)),
//                     ),
//                   ));
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }

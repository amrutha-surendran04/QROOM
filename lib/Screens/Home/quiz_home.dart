// ignore_for_file: deprecated_member_use, unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/quiz.dart';
import 'package:flutter_auth/Screens/Home/quiz_widget.dart';
//import 'package:flutter_auth/test_gen/quizMain.dart';

import 'package:flutter_auth/widgets/appbar_widget.dart';

// ignore: camel_case_types
class quizHome extends StatefulWidget {
  const quizHome({Key? key}) : super(key: key);

  @override
  State<quizHome> createState() => quizHomeState();
}

class quizHomeState extends State<quizHome> {
  final _dropdownFormKey = GlobalKey<FormState>();
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _dropdownFormKey,
        appBar: buildAppBar(context),
        body: Form(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              const SizedBox(
                  width: 320,
                  child: Text(
                    "Subject:",
                    style: TextStyle(
                      color: Color.fromARGB(255, 140, 41, 216),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  )),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        hintText: 'Select',
                        filled: true,
                        fillColor: Color.fromARGB(255, 235, 232, 238),
                      ),
                      value: selectedValue,
                      validator: (value) {
                        value == null ? "Select Subject" : print(value);
                      },
                      dropdownColor: const Color.fromARGB(255, 235, 232, 238),

                      // ignore: non_constant_identifier_names
                      // onChanged: ( dynamic String? newValue) async {
                      //   setState(() {
                      //     selectedValue = newValue!;
                      //   });
                      // },
                      items: dropdownItems,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                    ),
                  )),
              // SizedBox(
              //     width: 320,
              //     child: Text(
              //       "Level:",
              //       style: TextStyle(
              //         color: Color.fromARGB(255, 140, 41, 216),
              //         fontWeight: FontWeight.bold,
              //         fontSize: 16,
              //       ),
              //       textAlign: TextAlign.left,
              //     )),
              // Padding(
              //     padding: const EdgeInsets.all(20),
              //     child: Align(
              //       alignment: Alignment.topCenter,
              //       child: DropdownButtonFormField(
              //         decoration: const InputDecoration(
              //           hintText: 'Select',
              //           filled: true,
              //           fillColor: Color.fromARGB(120, 160, 124, 228),
              //         ),
              //         validator: (value) =>
              //             value == null ? "Select Subject" : null,
              //         dropdownColor: Color.fromARGB(255, 195, 163, 255),

              //         value: selectedValue,
              //         // ignore: non_constant_identifier_names
              //         // onChanged: ( dynamic String? newValue) async {
              //         //   setState(() {
              //         //     selectedValue = newValue!;
              //         //   });
              //         // },
              //         items: dropdownItems,
              //         onChanged: (Object? value) {
              //           return;
              //         },
              //       ),
              //     )),
              SizedBox(
                  width: 268,
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ButtonBar(
                          mainAxisSize: MainAxisSize.max,
                          overflowButtonSpacing: 20,
                          children: <Widget>[
                            RaisedButton(
                              color: const Color.fromARGB(255, 235, 232, 238),
                              onPressed: () {/** */},
                              child: const Text(
                                'Easy',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 152, 88, 216)),
                              ),
                            ),
                            RaisedButton(
                              color: const Color.fromARGB(255, 235, 232, 238),
                              onPressed: () {/** */},
                              child: const Text(
                                'Medium',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 152, 88, 216)),
                              ),
                            ),
                            RaisedButton(
                              color: const Color.fromARGB(255, 235, 232, 238),
                              onPressed: () {/** */},
                              child: const Text(
                                'Hard',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 152, 88, 216)),
                              ),
                            ),
                          ]))),

              // ignore: avoid_unnecessary_containers
              Container(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                              width: 348,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    // generate qp after validatin
                                    //if (_dropdownFormKey.currentState == null) {
                                    // print(_dropdownFormKey.);

                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return quizGen();
                                    }));
                                  },
                                  child: const Text(
                                    'Generate Test',
                                    style: TextStyle(fontSize: 15),
                                  ))))))
            ])));
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
        value: '',
        child: Text(
          "Select",
          style: TextStyle(color: Color.fromARGB(255, 85, 85, 85)),
        )),
    const DropdownMenuItem(
        value: "ds",
        child: Text(
          "Data Structures",
          style: TextStyle(color: Color.fromARGB(255, 85, 85, 85)),
        )),
    const DropdownMenuItem(
        value: "dbms",
        child: Text("Database Management System",
            style: TextStyle(color: Color.fromARGB(255, 85, 85, 85)))),
    const DropdownMenuItem(
        value: "os",
        child: Text("Operating System",
            style: TextStyle(color: Color.fromARGB(255, 85, 85, 85)))),
    const DropdownMenuItem(
        value: "coa",
        child: Text("Computer Organization and Architecture",
            style: TextStyle(color: Color.fromARGB(255, 85, 85, 85)))),
    const DropdownMenuItem(
        value: "aad",
        child: Text("Algorithm Analysis and Design",
            style: TextStyle(color: Color.fromARGB(255, 85, 85, 85)))),
    const DropdownMenuItem(
      value: "toc",
      child: Text("Theory of Computation",
          style: TextStyle(color: Color.fromARGB(255, 85, 85, 85))),
    ),
    const DropdownMenuItem(
      value: "cd",
      child: Text("Compiler Design",
          style: TextStyle(color: Color.fromARGB(255, 85, 85, 85))),
    ),
  ];
  return menuItems;
}

import 'package:flutter/material.dart';
import 'package:flutter_auth/user/user_data.dart';
import 'package:flutter_auth/widgets/appbar_widget.dart';
import 'package:string_validator/string_validator.dart';

class editSem extends StatefulWidget {
  editSem({Key? key}) : super(key: key);

  @override
  State<editSem> createState() => _editSemState();
}

class _editSemState extends State<editSem> {
  final _formKey = GlobalKey<FormState>();
  final semester = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    semester.dispose();
    super.dispose();
  }

  void updateUserValue(String sem) {
    user.sem = sem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    width: 320,
                    child: const Text(
                      "Current Semester",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: SizedBox(
                        height: 100,
                        width: 320,
                        child: TextFormField(
                          // Handles Form Validation
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Current Semester';
                            }
                            return null;
                          },
                          controller: semester,
                          decoration: const InputDecoration(
                            labelText: 'Current Semester',
                          ),
                        ))),
                Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 320,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              // if (_formKey.currentState!.validate() &&
                              //     isAlpha(semester.text)) {
                              //   updateUserValue(semester.text);
                              //   Navigator.pop(context);
                              // }

                              Validator:
                              (value) {
                                if (value == Null || value.isEmpty) {
                                  updateUserValue(semester.text);
                                  Navigator.pop(context);
                                }
                              };
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        )))
              ]),
        ));
  }
}

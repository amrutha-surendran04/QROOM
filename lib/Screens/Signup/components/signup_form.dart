// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/login_form.dart';
import 'package:flutter_auth/services/auth_serv.dart';
import 'package:string_validator/string_validator.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  String email = '';
  String pass = '';
  String name = '';
  String phone = '';
  String sem = '';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _sem = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //TextEditingController _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  Auth_serv _auth = Auth_serv();
  final _formvalidater = GlobalKey<FormState>();
  Auth_serv auth = Auth_serv();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            //textInputAction: TextInputAction.next,
            controller: _nameController,
            cursorColor: kPrimaryColor,
            onSaved: (name) {},
            decoration: const InputDecoration(
              hintText: "Name",
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Name";
              } else
                return null;
            },
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          // Spacer(),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                //textInputAction: TextInputAction.next,
                controller: _emailContoller,
                cursorColor: kPrimaryColor,
                onSaved: (email) {},
                decoration: const InputDecoration(
                  hintText: "Email",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.email),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter email";
                  } else
                    return null;
                },
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                // validator: (val) => val.length < 6
                //                 ? "Password must be 6+ characters"
                //                 : null,
                //             decoration: InputDecoration(hintText: "Password"),
                //             onChanged: (val) {
                //               password = val;
                //             },
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                // textInputAction: TextInputAction.next,
                controller: _phone,
                cursorColor: kPrimaryColor,
                onSaved: (phone) {},
                decoration: const InputDecoration(
                  hintText: "Contact",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.phone),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  } else if (isAlpha(value)) {
                    return 'Only Numbers Please';
                  } else if (value.length < 10) {
                    return 'Please enter a VALID phone number';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    phone = value;
                  });
                },
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                keyboardType: TextInputType.text,
                // textInputAction: TextInputAction.next,
                controller: _sem,
                cursorColor: kPrimaryColor,
                onSaved: (sem) {},
                decoration: const InputDecoration(
                  hintText: "Semester",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.school),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Current Semester";
                  } else
                    return null;
                },
                onChanged: (value) {
                  setState(() {
                    sem = value;
                  });
                },
              )),

          Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                //textInputAction: TextInputAction.next,
                controller: _passwordController,
                obscureText: true,
                cursorColor: kPrimaryColor,
                onSaved: (pass) {},
                decoration: const InputDecoration(
                  hintText: "Create a Password",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.lock),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "enter valid password";
                  } else
                    return null;
                },
                onChanged: (value) {
                  setState(() {
                    pass = value;
                  });
                },
              )),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          //   child: TextFormField(
          //     textInputAction: TextInputAction.done,
          //     obscureText: true,
          //     cursorColor: kPrimaryColor,
          //     decoration: const InputDecoration(
          //       hintText: "Confirm Password",
          //       prefixIcon: Padding(
          //         padding: EdgeInsets.all(defaultPadding),
          //         child: Icon(Icons.lock),
          //       ),
          //     ),
          //     validator: (value) {
          //       if (value == null ||
          //           value.isEmpty ||
          //           value.length != pass.length) {
          //         return "Please enter the same password";
          //       } else {
          //         return null;
          //       }

          //     onChanged: (value) {
          //       setState(() {
          //         pass = value;
          //       });
          //     },
          //   ),
          // ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () async {
              dynamic result = auth.signup(
                  name: name, email: email, phone: phone, sem: sem, pass: pass);
              print('Sign Up successful');
              if (kDebugMode) {
                print(email);
                print(name);
              }
              //var formState = _key.currentState!;
              // if (_key.c == null) {
              //   //bool resp = FormState().validate();
              //   // If the form is valid, display a snackbar. In the real world,
              //   // you'd often call a server or save the information in a database.
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(content: Text('Processing Data')),
              //   );
              // }
              if (_key == null) {
                return showAlertDialog(context);
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }));
              }
            },
            child: Text("Sign Up".toUpperCase()),
          ),

          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

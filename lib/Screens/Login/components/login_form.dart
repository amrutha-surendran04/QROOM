// ignore_for_file: use_build_context_synchronously

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/auth_main.dart';
import 'package:flutter_auth/services/auth_serv.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Home/dash.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email = '';
  String pass = '';

  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Auth_serv _auth = Auth_serv();
  final key = GlobalKey<FormState>();
  final _formvalidater = GlobalKey<FormState>();
  Auth_serv auth = Auth_serv();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            //textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: _emailContoller,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: const Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              //textInputAction: TextInputAction.done,
              controller: _passwordController,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
              validator: (value) {
                if (pass.isEmpty || pass.length < 3) {
                  return 'enter valid password';
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                setState(() {
                  pass = value;
                });
              },
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () async {
                dynamic result = await auth.signin(email: email, pass: pass);
                print(result);
                if (kDebugMode) {
                  print(email);
                }
                if (key == null) {
                  return showAlertDialog(context);
                }
                //if (email != '' || pass != '')
                // if (key.currentState!.validate()) {
                //   // If the form is valid, display a snackbar. In the real world,
                //   // you'd often call a server or save the information in a database.
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text('Processing Data')),
                //   );
                // }
                //if (email != '' || pass != '')

                // do password mismatch check
                else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Home(
                      accesstoken: '',
                    );
                  }));
                }
                //homeScreen
              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
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

void showAlertDialog(BuildContext context) {
  Widget okButton = FlatButton(
    child: Text("OK",
        style:
            TextStyle(fontSize: 15, color: Color.fromARGB(255, 111, 53, 165))),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    content: Text("Please Enter Valid Details",
        style: TextStyle(
            fontFamily: 'RobotoMono-Bold',
            fontSize: 15,
            color: Color.fromARGB(255, 111, 53, 165))),
    actions: [
      okButton,
    ],
    backgroundColor: Colors.white,
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

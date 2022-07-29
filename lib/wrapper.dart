import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/dash.dart';
import 'package:flutter_auth/Screens/Login/components/login_form.dart';
import 'package:flutter_auth/services/users.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    return user == null
        ? const LoginForm()
        : const Home(
            accesstoken: '',
          );
  }
}

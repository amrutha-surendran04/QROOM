import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/dash.dart';
import 'package:flutter_auth/Screens/Login/components/login_form.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/services/users.dart';
import 'package:provider/provider.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    if (kDebugMode) {
      print(user);
    }
    // ignore: prefer_const_constructors
    return user == null
        ? LoginForm()
        : Home(
            accesstoken: '',
          );
  }

  static signout() {}
}

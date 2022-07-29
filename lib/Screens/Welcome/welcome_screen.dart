import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/login_form.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import '../../components/background.dart';
import '../../responsive.dart';
import '../Login/components/login_screen_top_image.dart';
//import 'components/welcome_image.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileLoginScreen(),
          desktop: Row(
            children: [
              const Expanded(
                child: LoginScreenTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 450,
                      child: LoginForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names

@override
Widget build(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      const LoginScreenTopImage(),
      Row(
        children: const [
          Spacer(),
          Expanded(
            flex: 8,
            child: LoginForm(),
          ),
          Spacer(),
        ],
      ),
    ],
  );
}

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreen(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

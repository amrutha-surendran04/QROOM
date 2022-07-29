import 'package:flutter/material.dart';
import 'package:flutter_auth/auth_main.dart';
import 'package:flutter_auth/services/auth_serv.dart';
import 'package:flutter_auth/services/users.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      catchError: (_, __) => null,
      initialData: null,
      value: Auth_serv().user,
      child: const MaterialApp(
        home: Auth(),
      ),
    );
  }
}

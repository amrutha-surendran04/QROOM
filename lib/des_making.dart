import 'package:flutter/material.dart';
import 'package:flutter_auth/services/auth_serv.dart';
import 'package:flutter_auth/services/users.dart';
import 'package:flutter_auth/wrapper.dart';
import 'package:provider/provider.dart';

class Decession extends StatefulWidget {
  const Decession({Key? key}) : super(key: key);

  @override
  State<Decession> createState() => _DecessionState();
}

class _DecessionState extends State<Decession> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      catchError: (_, __) => null,
      initialData: null,
      value: Auth_serv().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

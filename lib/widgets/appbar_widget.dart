import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    iconTheme: IconThemeData(
        color: Color.fromARGB(255, 142, 25,
            252)), // set backbutton color here which will reflect in all screens.
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

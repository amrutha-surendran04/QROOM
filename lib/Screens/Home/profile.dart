import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_auth/components/editSem.dart';
import 'package:flutter_auth/components/edit_description.dart';
import 'package:flutter_auth/components/edit_name.dart';
import 'package:flutter_auth/components/edit_phone.dart';
import 'package:flutter_auth/user/user_data.dart';
import 'package:flutter_auth/widgets/appbar_widget.dart';

import '../../components/edit_email.dart';
import '../../user/user.dart';

// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          // AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   toolbarHeight: 10,
          // ),
          // ignore: prefer_const_constructors
          Center(
              child: const Padding(
                  padding: EdgeInsets.only(bottom: 69.79),
                  // padding: EdgeInsets.symmetric(vertical: defaultPadding),
                  child: //Icon(Icons.edit,color:Color.fromARGB(255, 111, 53, 165) ),
                      //back to dash
                      Text(
                    'Profile Setting',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 111, 53, 165),
                    ),
                  ))),
          // InkWell(
          //     onTap: () {
          //       navigateSecondPage(EditImagePage());
          //     },
          // ,child: DisplayImage(
          //   imagePath: user.image,
          //   onPressed: () {},
          // )),
          buildUserInfoDisplay(user.name, 'Name', const EditNameFormPage()),
          buildUserInfoDisplay(user.phone, 'Phone', const EditPhoneFormPage()),
          buildUserInfoDisplay(user.sem, 'Semester', editSem()),
          buildUserInfoDisplay(user.email, 'Email', const EditEmailFormPage()),
          Expanded(
            flex: 4,
            child: buildAbout(user),
          )
        ],
      ),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 111, 53, 165),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 47.5,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: const BorderSide(
                    color: Color.fromARGB(255, 111, 53, 165),
                    width: 1,
                  ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              navigateSecondPage(editPage);
                            },
                            //Display user details
                            child: Text(
                              getValue,
                              style: const TextStyle(
                                  // fontSize: 16,
                                  // height: 1.4,
                                  color: Color.fromARGB(0, 255, 255, 255)),
                            ))),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: const Color.fromARGB(255, 111, 53, 165),
                      size: 40.0,
                    )
                  ]))
            ],
          ));

  // Widget builds the About Me Section
  Widget buildAbout(Users user) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About Yourself',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 111, 53, 165),
            ),
          ),
          const SizedBox(height: 1),
          Container(
              width: 350,
              height: 47.5,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Color.fromARGB(255, 111, 53, 165),
                width: 1,
              ))),
              child: Row(children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          navigateSecondPage(EditDescriptionFormPage());
                        },
                        child: const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Align(
                              alignment: Alignment.center,
                              // child: Text(
                              //   user.aboutMeDescription,
                              //   style: TextStyle(
                              //     color: Color.fromARGB(255, 140, 141, 141),
                              //     fontSize: 16,
                              //     //height: 1.4,
                              //   ),
                              // )
                            )))),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Color.fromARGB(255, 111, 53, 165),
                  size: 40.0,
                )
              ]))
        ],
      ));

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    //setState(() {});
    return ProfilePage();
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}

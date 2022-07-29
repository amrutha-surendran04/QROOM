import 'dart:convert';

import 'package:flutter_auth/components/edit_image.dart';

import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static Users myUser = Users(
    //image: 'C:/flutt/qroom/assets/images/pat.jpg',
    name: 'Name',
    email: 'Email',
    sem: 'Semester',
    phone: 'Phone',
    aboutMeDescription: 'About',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(Users user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static Users getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : Users.fromJson(jsonDecode(json));
  }
}
// child: Wrap(
//           children: [
//             FloatingActionButton(
//               onPressed: () {
//                 String svg = randomAvatarString(
//                   DateTime.now().toIso8601String(),
//                   trBackground: false,
//                 );
//                 log(svg);

//                 _painters.add(
//                   randomAvatar(
//                     DateTime.now().toIso8601String(),
//                     height: 50,
//                     width: 52,
//                   ),
//                 );
//                 _controller.text = svg;
//                 setState(() {});
//               },
//               tooltip: 'Generate',
//               child: const Icon(Icons.gesture),
//             ),
//             const SizedBox(height: 20),
//             ..._painters,
//           ],
//         ),
//       )
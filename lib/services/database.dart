import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auth/user/user.dart';

class Database {
  // ignore: prefer_typing_uninitialized_variables
  final uid;
  Database({this.uid});

  final CollectionReference usercollc =
      FirebaseFirestore.instance.collection('user');

  Future updateuser(
      String name, String email, String phone, String sem, String pass) async {
    return await usercollc.doc(uid).set({
      'name': name,
      'email': email,
      'phone': phone,
      'sem': sem,
      'pass': pass
    });
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await usercollc.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

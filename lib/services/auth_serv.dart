// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/services/database.dart';
import 'package:flutter_auth/services/users.dart';
// ignore: depend_on_referenced_packages
//import 'package:meta/meta.dart';

// ignore: camel_case_types
class Auth_serv {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  Users _usersFromFirebase(User) {
    return Users(uid: User.uid);
  }

  Stream<Users> get user {
    return _auth.authStateChanges().map(_usersFromFirebase);
  }

  Future signin({required String email, required String pass}) async {
    try {
      email = email.trim();
      pass = pass.trim();
      UserCredential credential =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signup(
      {required String name,
      required String email,
      required String phone,
      required String sem,
      required String pass}) async {
    try {
      email = email.trim();
      pass = pass.trim();
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      User? user = credential.user;
      await Database(uid: user!.uid).updateuser(name, email, phone, sem, pass);
      return _usersFromFirebase(user);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signout() async {
    FirebaseAuth.instance.signOut();
  }
}

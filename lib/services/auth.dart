import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nhs/models/theuser.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance; //default

  //create theuser object based on FirebaseUser
  TheUser? _userFromFirebaseUser(User? user) {
    return user != null ? TheUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<TheUser?> get user {
    return _auth
        .authStateChanges()
        //.map((User? user)=> _userFromFirebaseUser(user!));  //same as line below
        .map(_userFromFirebaseUser);
  }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    final googleCurrentUser =
        GoogleSignIn().currentUser ?? await GoogleSignIn().signIn();
    if (googleCurrentUser != null) {
      await GoogleSignIn().disconnect();
    }
    try {
      return await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}

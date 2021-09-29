import 'package:chat_app/Screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/Screens/chat_screen.dart';
import 'package:flutter/material.dart';

class Services {
  final auth = FirebaseAuth.instance;

  void createUser(context, email, password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {Navigator.pushNamed(context, ChatScreen.id)});
    } catch (e) {
      errorBox(e, context);
    }
  }

  void loggedInUser(context, email, password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {Navigator.pushNamed(context, ChatScreen.id)});
    } catch (e) {
      errorBox(e, context);
    }
  }

  void signedOut(context) async {
    try {
      await auth.signOut().then((value) => {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false)
      });
    } catch (e) {
      errorBox(e, context);
    }
  }

  void errorBox(e, context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(e.toString()),
          );
        });
  }
}

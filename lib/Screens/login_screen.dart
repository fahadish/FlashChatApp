import 'package:chat_app/Components/rounded_button.dart';
import 'package:chat_app/FireBase/fire_base.dart';
import 'package:chat_app/Screens/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'Login_Screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Services services = Services();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String messagesText = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'Logo',
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/NicePng.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration:
                  kTextDecoration.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextDecoration.copyWith(hintText: 'Password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
                title: 'Logged In',
                colour: Colors.lightBlue,
                onPressed: () async {
                  final SharedPreferences pref = await SharedPreferences.getInstance();
                  if (email.isNotEmpty && password.isNotEmpty) {
                    services.loggedInUser(context, email, password);
                    pref.setString(email, password);
                  } else {
                    services.errorBox(
                        'please provided  the valid email and password',
                        context);
                  }
                })
          ],
        ),
      ),
    );
  }
}

import 'package:chat_app/Components/rounded_button.dart';
import 'package:chat_app/FireBase/fire_base.dart';
import 'package:chat_app/Screens/const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'Registration_Screen';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email = '';
  String password = '';
  String messageText = '';

  Services services = Services();
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
                height: 200,
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
              height: 18.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextDecoration.copyWith(hintText: 'Password'),
            ),
            SizedBox(
              height: 8.0,
            ),
            RoundedButton(
                title: 'Registered',
                colour: Colors.blueGrey,
                onPressed: () async{
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  if (password.isNotEmpty && email.isNotEmpty) {
                    services.createUser(context, email, password);
                    pref.setString(email, password);
                  } else {
                    services.errorBox(
                        'Field must not empty please provide valid email and password',
                        context);
                  }
                })
          ],
        ),
      ),
    );
  }
}

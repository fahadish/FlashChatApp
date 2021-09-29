

import 'package:chat_app/Screens/const.dart';
import 'package:chat_app/Screens/login_screen.dart';
import 'package:chat_app/Screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:chat_app/Components/rounded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'Welcome_Screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  final controller = AnimationController;
late Animation animation;
@override
  void initState()

{
  super.initState();

  final controller = AnimationController(vsync: this, duration: Duration(seconds: 5));
  controller.forward();
controller.addStatusListener((status) {(status);});
controller.addListener(() {
setState(() {

  (animation.value);
});
});

animation = ColorTween(begin: Colors. blueGrey ,end: Colors.white).animate(controller)  ;

  }
@override
  void dispose() {
    animation.isDismissed;
    super.dispose();
  }




  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                Hero(
                  tag: 'Logo',
                  child: SizedBox(
                    child: Image.asset('images/NicePng.png'),
                    height: 85.0,
                  ),
                ),

                AnimatedTextKit(animatedTexts: [
                  ColorizeAnimatedText('Flash Chat',textAlign: TextAlign.center,
                      speed: Duration(seconds: 1),
                      textStyle: colorizeTextStyle, colors: colorizeColors,),
                ],isRepeatingAnimation: true,
                  totalRepeatCount: 4,
                ),
              ],
            ),
            SizedBox(height: 48.0),
            RoundedButton(
                title: 'Log In',
                colour: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            RoundedButton(
                title: 'Register',
                colour: Colors.blueGrey,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                })
          ],
        ),
      ),
    );
  }
}

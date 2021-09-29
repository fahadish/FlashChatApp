import 'package:chat_app/Screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Screens/login_screen.dart';
import 'package:chat_app/Screens/registration_screen.dart';
import 'package:chat_app/Screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());

}
class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp( debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id ,
      routes: { WelcomeScreen.id : (context) => WelcomeScreen(),
        LoginScreen.id : (context) =>  LoginScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        ChatScreen.id : (context) => ChatScreen()


      },
    );
  }
}

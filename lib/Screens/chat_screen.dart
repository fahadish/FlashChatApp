import 'package:chat_app/FireBase/fire_base.dart';
import 'package:chat_app/Screens/const.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

var loginUser = FirebaseAuth.instance.currentUser;
class ChatScreen extends StatefulWidget {
  static const String id = 'Chat_Screen';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Services services = Services();
  final auth = FirebaseAuth.instance;

  getCurrentUser(){
    final user = auth.currentUser;
    if(user!=null){
      loginUser = user;
    }
  }

  String messageText = '';

  @override
  void initState() {

    super.initState();
  getCurrentUser();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( automaticallyImplyLeading: false,
        leading: null,
        actions: <Widget>[
          IconButton(onPressed: () async{

            SharedPreferences pref =await SharedPreferences.getInstance();
            pref.remove('email');
            services.signedOut(context);


          }, icon: Icon(Icons.logout))
        ],
        title: Text(loginUser!.email.toString()),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: kBoxDecoration,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    onChanged: (value) {
                      messageText = value;
                    },
                    decoration: kMessageTextFieldDecoration)
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Send',
                        style: kSendButtonTextStyle,

                      ))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

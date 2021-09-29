import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
const kTextContainerDecoration = BoxDecoration(
    border: Border(top: BorderSide(color: Colors.blueAccent, width: 2.0)));



const kMessageTextFieldDecoration = InputDecoration(
    hintText: 'Type your Message here',
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
    border: UnderlineInputBorder());

const kBoxDecoration = BoxDecoration(
    border: Border(top: BorderSide(color: Colors.lightBlueAccent, width: 2.0)));

const colorizeColors = [
  Colors.black,
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red
];
const colorizeTextStyle = TextStyle(
    fontSize: 50,
    fontFamily: 'Scheherazade',
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic);

const kTextDecoration = InputDecoration(
    hintText: 'Enter your email',
    hintStyle: TextStyle(
      color: Colors.blueGrey,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0))),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0))),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0))));

import 'package:flutter/material.dart';

const buttonTextStyle = TextStyle(color: Colors.white, fontSize: 21);
var buttonStyle = ButtonStyle(
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    backgroundColor: MaterialStateProperty.all(Color(0xffF24405)),
    elevation: MaterialStateProperty.all(5));
const textStyle = TextStyle(color: Colors.black, fontSize: 17);
const bigTextStyle =
    TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold);
const appBarTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

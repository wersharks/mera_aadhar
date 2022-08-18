import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const buttonTextStyle = TextStyle(color: Colors.white, fontSize: 18);
var buttonStyle = ButtonStyle(
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(32))),
    backgroundColor: MaterialStateProperty.all(Color(0xffF8774A)),
    elevation: MaterialStateProperty.all(1));

const textStyle = TextStyle(color: Colors.black, fontSize: 17);
const bTextStyle =
    TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold);
const oTextStyle = TextStyle(
    color: Color(0xffF8774A), fontSize: 28, fontWeight: FontWeight.bold);
const kTextSTyle = TextStyle(color: Color(0xffE34637), fontSize: 16);
const bigTextStyle =
    TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold);
const appBarTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
);
const kSnackbarStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontFamily: 'Jose',
);
var kPoppinWhite = GoogleFonts.poppins(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white));
var kPoppinBlack = GoogleFonts.poppins(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black));

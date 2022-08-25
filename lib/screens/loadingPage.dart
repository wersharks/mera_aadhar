import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mera_aadhar/screens/language_selector.dart';
import 'package:mera_aadhar/screens/modeSelectionPage.dart';
import 'package:mera_aadhar/screens/onBoardingPage.dart';
import 'package:mera_aadhar/screens/serviceSelectionPage.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      (FirebaseAuth.instance.currentUser!=null)? Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => ServiceSelectionPage())):
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => LanguageSelectorScreen()));
    });
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 120,
              child: Image.asset(
                'assets/aadharlogo.png',
                width: 170,
                height: 170,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

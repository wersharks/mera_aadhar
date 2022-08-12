import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mera_aadhar/screens/verification.dart';
import 'package:mera_aadhar/widgets/my_card.dart';

class LoginType extends StatelessWidget {
  const LoginType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: MyCard(
              text: "LOGIN USING PHONE NUMBER",
              icon: FontAwesomeIcons.squarePhone,
              onTheTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Verification()));
              },
            ),
          ),
          Expanded(
            child: MyCard(
              text: "BOOK USING HELPLINE",
              icon: FontAwesomeIcons.headphonesSimple,
              onTheTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Verification()));
              },
            ),
          ),
          Expanded(
            child: MyCard(
              text: "LOREM IPSUM",
              icon: FontAwesomeIcons.fireBurner,
              onTheTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Verification()));
              },
            ),
          )
        ],
      )),
    );
  }
}

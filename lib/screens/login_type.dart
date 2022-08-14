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
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: MyCard(
              text: "Book operator",
              icon: FontAwesomeIcons.squarePhone,
              onTheTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Verification()));
              },
            ),
          ),
          Expanded(
            child: MyCard(
              text: "Use helpline",
              icon: FontAwesomeIcons.headphonesSimple,
              onTheTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Verification()));
              },
            ),
          ),
          Expanded(
            child: MyCard(
              text: "Self Update",
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

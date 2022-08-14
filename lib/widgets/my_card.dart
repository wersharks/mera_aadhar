import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:mera_aadhar/screens/verification.dart';
import 'package:mera_aadhar/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCard extends StatelessWidget {
  String text;
  IconData icon;
  Function onTheTap;
  MyCard({required this.text, required this.icon, required this.onTheTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          onTheTap();
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    offset: Offset(0, 0),
                    spreadRadius: .1,
                    blurRadius: 3),
              ],
              borderRadius: BorderRadius.all(Radius.circular(25)),
              border: Border.all(color: Colors.grey.withOpacity(.01))),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 100,
                  color: Colors.orange,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: oTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

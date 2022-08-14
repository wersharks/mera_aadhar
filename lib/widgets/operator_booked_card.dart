import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:mera_aadhar/screens/verification.dart';
import 'package:mera_aadhar/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mera_aadhar/utilities/size_config.dart';

class OperatorBookedCard extends StatelessWidget {
  String name;
  String rating;
  String task;
  String time;
  String phoneNo;

  OperatorBookedCard(
      {required this.name,
      required this.phoneNo,
      required this.rating,
      required this.task,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.1),
                  offset: Offset(0, 0),
                  spreadRadius: .1,
                  blurRadius: 3),
            ],
            borderRadius: BorderRadius.all(Radius.circular(25)),
            border: Border.all(color: Colors.grey.withOpacity(.01))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 28),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/operator.png',
                  width: getProportionateScreenWidth(100),
                  height: getProportionateScreenHeight(120),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: kTextSTyle,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Call',
                            style: buttonTextStyle.copyWith(fontSize: 15),
                          ),
                          style: buttonStyle,
                        )
                      ],
                    ),
                    Text(
                      "Rated $rating⭐",
                      style: kTextSTyle,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Task: $task',
                      style: kTextSTyle,
                    ),
                    Text(
                      'Time: $time',
                      style: kTextSTyle,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

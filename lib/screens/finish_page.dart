import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mera_aadhar/utilities/constants.dart';
import 'package:mera_aadhar/utilities/size_config.dart';
import 'package:mera_aadhar/widgets/my_card.dart';
import 'package:mera_aadhar/widgets/operator_booked_card.dart';

class FinishPage extends StatefulWidget {
  const FinishPage({Key? key}) : super(key: key);

  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfig().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      extendBodyBehindAppBar: true,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: getProportionateScreenHeight(270),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.1),
                    offset: Offset(0, 0),
                    spreadRadius: .1,
                    blurRadius: 15),
              ],
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              // border: Border.all(color: Colors.grey.withOpacity(.01))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(1),
                ),
                Center(
                  child: Image.asset(
                    'assets/aadharlogo.png',
                    width: getProportionateScreenWidth(125),
                    height: getProportionateScreenHeight(112),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Finish',
                        style: textStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(100),
                      child: Divider(
                        thickness: 3,
                        color: Color(0xffFA4A0C),
                        height: getProportionateScreenHeight(4),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Text(
              'Your details have been collected',
              style: bTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Image.asset(
            'assets/tick.png',
            width: getProportionateScreenWidth(175),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Check your application status using appointment ID :',
              style: bTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'XXX-XXX-XXX',
              style: bTextStyle.copyWith(fontSize: 25),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
              width: 350,
              height: getProportionateScreenHeight(60),
              child: TextButton(
                  style: buttonStyle,
                  onPressed: () async {},
                  child: Text(
                    'Give Feedback',
                    style: buttonTextStyle,
                  )))
        ],
      )),
    );
  }
}

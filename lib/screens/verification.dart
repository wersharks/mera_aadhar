import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mera_aadhar/utilities/constants.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  FocusNode mobileNumberFocusNode = FocusNode();
  FocusNode otpFocusNode = FocusNode();
  bool isOTPScreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
              (!isOTPScreen) ? 'MOBILE VERIFICATION' : 'VERIFY YOUR ACCOUNT',
              style: appBarTextStyle)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 55,
            ),
            Center(
              child: Image.asset(
                (!isOTPScreen)
                    ? 'assets/verification1.png'
                    : 'assets/verification2.png',
                width: 292,
                height: 200,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
                (!isOTPScreen)
                    ? 'Please enter your mobile number.'
                    : 'Enter the OTP received on your phone.',
                style: textStyle),
            SizedBox(
              height: 30,
            ),
            if (!isOTPScreen)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {});
                  },
                  child: IntlPhoneField(
                    dropdownIcon: Icon(
                      Icons.arrow_drop_down,
                      color: mobileNumberFocusNode.hasFocus
                          ? Colors.orange
                          : Colors.black54,
                    ),
                    cursorColor: mobileNumberFocusNode.hasFocus
                        ? Colors.orange
                        : Colors.black54,
                    focusNode: mobileNumberFocusNode,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFF3F5F5),
                      filled: true,
                      counterText: '',
                      labelStyle: TextStyle(
                          color: mobileNumberFocusNode.hasFocus
                              ? Colors.orange
                              : Colors.black54),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Phone Number',
                    ),
                    flagsButtonPadding: EdgeInsets.symmetric(horizontal: 5),
                    initialCountryCode: 'IN',
                  ),
                ),
              ),
            if (isOTPScreen)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Focus(
                  focusNode: otpFocusNode,
                  child: OtpTextField(
                    cursorColor:
                        otpFocusNode.hasFocus ? Colors.orange : Colors.black54,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    filled: true,
                    fillColor: Color(0xFFF3F5F5),
                    borderColor: Color(0xFFF3F5F5),
                    focusedBorderColor: Color(0xFFF3F5F5),
                    enabledBorderColor: Color(0xFFF3F5F5),
                    showFieldAsBox: true,
                    numberOfFields: 6,
                  ),
                ),
              ),
            if (isOTPScreen)
              SizedBox(
                height: 20,
              ),
            if (isOTPScreen)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn't get OTP? ", style: textStyle),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend',
                        style: TextStyle(color: Colors.red, fontSize: 17),
                      ))
                ],
              ),
            SizedBox(
              height: 70,
            ),
            SizedBox(
              width: 275,
              height: 40,
              child: TextButton(
                  style: buttonStyle,
                  onPressed: () {
                    setState(() {
                      isOTPScreen = true;
                    });
                  },
                  child: Text(
                    (!isOTPScreen) ? 'SEND OTP' : 'VERIFY',
                    style: buttonTextStyle,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

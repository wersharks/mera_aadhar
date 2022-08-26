import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mera_aadhar/language_handler.dart';
import 'package:mera_aadhar/services/auth/otp_signin.dart';
import 'package:mera_aadhar/utilities/constants.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:mera_aadhar/utilities/size_config.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final _formKey = GlobalKey<FormState>();

  FocusNode mobileNumberFocusNode = FocusNode();
  FocusNode otpFocusNode = FocusNode();
  bool isOTPScreen = false;
  //final sizeConfig = SizeConfig();
  @override
  void initState() {
    super.initState();

    OTPInteractor()
        .getAppSignature()
        .then((value) => print('signature - $value'));
    final controller = OTPTextEditController(
      codeLength: 6,
      onCodeReceive: (code) => print('Your Application receive code - $code'),
    )..startListenUserConsent(
        (code) {
          final exp = RegExp(r'(\d{6})');
          return exp.stringMatch(code ?? '') ?? '';
        },
      );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfig().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: (isOTPScreen)
          ? FloatingActionButton(
              child: Container(
                  width: 60,
                  height: 60,
                  child: Icon(
                    Icons.arrow_forward,
                    size: 30,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [Color(0xffF8774A), Color(0xffF8774A)],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft))),
              onPressed: ()async {

 if (isOTPScreen ) {
                          setState(() {
                            Provider.of<Auth>(context, listen: false)
                                .isLoading = true;
                          });
                          await Provider.of<Auth>(context, listen: false)
                              .submitOTP(context);
                          setState(() {
                            Provider.of<Auth>(context, listen: false)
                                .isLoading = false;
                          });
                        }


              },
            )
          : null,

      backgroundColor: Color(0xffF2F2F2),
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //     iconTheme: const IconThemeData(color: Colors.black),
      //     elevation: 0,
      //     centerTitle: true,
      //     backgroundColor: Colors.transparent,
      //     title: Text(
      //         (!isOTPScreen) ? 'MOBILE VERIFICATION' : 'VERIFY YOUR ACCOUNT',
      //         style: appBarTextStyle)),
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
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
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
                          translatedStrings["login"].toString(),
                          style:
                              textStyle.copyWith(fontWeight: FontWeight.bold),
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
            // Center(
            //   child: Image.asset(
            //     (!isOTPScreen)
            //         ? 'assets/verification1.png'
            //         : 'assets/verification2.png',
            //     width: 292,
            //     height: 200,
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
            if (isOTPScreen) Text('Enter OTP', style: oTextStyle),
            Text(
                (!isOTPScreen)
                    ? 'Please enter your mobile number.'
                    : 'Enter the OTP received on your phone.',
                style: textStyle),
            SizedBox(
              height: 20,
            ),
            if (!isOTPScreen)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {});
                    },
                    child: IntlPhoneField(
                      onChanged: (value) {
                        Provider.of<Auth>(context, listen: false).mobileNumber =
                            value.number;
                      },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      validator: (value) {
                        // List<String> validArray=['1','2','3','4','5','6','7','8','9','0'];
                      },
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
                        fillColor: Colors.white,
                        filled: true,
                        counterText: '',
                        labelStyle: TextStyle(
                            color: mobileNumberFocusNode.hasFocus
                                ? Colors.orange
                                : Colors.black54),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText: 'Phone Number',
                      ),
                      flagsButtonPadding: EdgeInsets.symmetric(horizontal: 5),
                      initialCountryCode: 'IN',
                    ),
                  ),
                ),
              ),
            if (isOTPScreen)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Focus(
                  focusNode: otpFocusNode,
                  child: OtpTextField(
                    onSubmit: (value) {
                      Provider.of<Auth>(context, listen: false).otp = value;
                      print(value);
                    },
                    cursorColor:
                        otpFocusNode.hasFocus ? Colors.orange : Colors.black54,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    filled: true,
                    fillColor: Colors.white,
                    borderColor: Colors.white,
                    focusedBorderColor: Colors.white,
                    enabledBorderColor: Colors.white,
                    showFieldAsBox: true,
                    numberOfFields: 6,
                  ),
                ),
              ),
            if (isOTPScreen)
              SizedBox(
                height: 10,
              ),
            if (isOTPScreen)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn't get OTP? ", style: textStyle),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        translatedStrings["resend"].toString(),
                        style: TextStyle(color: Colors.red, fontSize: 17),
                      ))
                ],
              ),
            SizedBox(
              height: 30,
            ),
          if(!isOTPScreen) SizedBox(
              width: 325,
              height: getProportionateScreenHeight(50),
              child: !Provider.of<Auth>(context).isLoading
                  ? TextButton(
                      style: buttonStyle,
                      onPressed: () async {
                        
                        if (!isOTPScreen && _formKey.currentState!.validate()) {
                          setState(() {
                            Provider.of<Auth>(context, listen: false)
                                .isLoading = true;
                          });
                          await Provider.of<Auth>(context, listen: false)
                              .submitPhoneNumber(context);
                          setState(() {
                            Provider.of<Auth>(context, listen: false)
                                .isLoading = false;
                            isOTPScreen = true;
                            
                          });
                        }
                       
                      },
                      child: Text(
                       'Request OTP',
                        style: buttonTextStyle,
                      ))
                  : Center(
                      child: CircularProgressIndicator(
                        color: Colors.redAccent,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

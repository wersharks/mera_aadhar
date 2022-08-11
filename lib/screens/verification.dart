import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
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
          title: const Text('MOBILE VERIFICATION',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ))),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 55,
            ),
            Center(
              child: Image.asset(
                'assets/verification1.png',
                width: 292,
                height: 200,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text('Please enter your mobile number.',
                style: TextStyle(color: Colors.black, fontSize: 17))
          ],
        ),
      ),
    );
  }
}

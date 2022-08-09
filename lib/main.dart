import 'package:flutter/material.dart';
import 'package:mera_aadhar/screens/verification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'मेरा Aadhar',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home:Verification(),
    );
  }
}


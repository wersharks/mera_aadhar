import 'package:flutter/material.dart';
import 'package:mera_aadhar/screens/home_page.dart';
import 'package:mera_aadhar/screens/verification.dart';
import 'package:mera_aadhar/services/auth/otp_signin.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Auth())],
      child: MaterialApp(
        title: 'मेरा Aadhar',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

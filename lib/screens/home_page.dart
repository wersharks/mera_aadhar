import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mera_aadhar/screens/verification.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          TextButton(
            child: Text("CLICK"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Verification()));
            },
          ),
        ],
      ),
    ));
  }
}
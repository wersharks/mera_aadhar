import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mera_aadhar/screens/login_type.dart';
import 'package:mera_aadhar/screens/verification.dart';
import 'package:mera_aadhar/services/auth/otp_signin.dart';
import 'package:mera_aadhar/utilities/constants.dart';
import 'package:mera_aadhar/screens/map_basic.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          TextButton(
            style: buttonStyle,
            child: Text("CLICK"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginType()));
            },
          ),
          TextButton(
            child: Text("CLICK MAP"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LiveLocationPage()));
            },
          ),
          TextButton(
            child: Text("Logout"),
            onPressed: () {
              Provider.of<Auth>(context,listen: false).logout(context);
            },
          ),
        ],
      ),
    ));
  }
}

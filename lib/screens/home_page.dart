import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mera_aadhar/screens/book_operator.dart';
import 'package:mera_aadhar/screens/finish_page.dart';
import 'package:mera_aadhar/screens/login_type.dart';
import 'package:mera_aadhar/screens/operator_booked.dart';
import 'package:mera_aadhar/screens/date_page.dart';
import 'package:mera_aadhar/screens/operator_selection.dart';
import 'package:mera_aadhar/screens/slot_page.dart';
import 'package:mera_aadhar/screens/verification.dart';
import 'package:mera_aadhar/services/auth/otp_signin.dart';
import 'package:mera_aadhar/utilities/constants.dart';
import 'package:mera_aadhar/screens/map_basic.dart';
import 'package:provider/provider.dart';
import 'modeSelectionPage.dart';
import 'serviceSelectionPage.dart';
import 'onBoardingPage.dart';
import 'loadingPage.dart';
import 'package:mera_aadhar/testscreens/testfirebase.dart';
import 'documentCheckPage.dart';
import 'MapIntroductionPage.dart';
import 'editAddressPage.dart';
import 'op_finishpage.dart';
import 'op_welcomescreen.dart';
import 'op_map.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
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
            child: Text("Welcome Page"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoadingPage()));
            },
          ),
          TextButton(
            child: Text("Op-Finish Page"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => opFinishPage()));
            },
          ),
          TextButton(
            child: Text("Op-welcome screen"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoadingPage()));
            },
          ),
          TextButton(
            child: Text("Op-map"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => opmap()));
            },
          ),
          TextButton(
            child: Text("Welcome Sliders"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OnBoardingScreen()));
            },
          ),
          TextButton(
            child: Text("Document Check Page"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DocumentCheckPage()));
            },
          ),
          TextButton(
            child: Text("Map Introduction Page"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MapIntroductionPage()));
            },
          ),
          TextButton(
            child: Text("Edit Address Page"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditAddressPage()));
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
              Provider.of<Auth>(context, listen: false).logout(context);
            },
          ),
          TextButton(
            child: Text("Operator booked"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OperatorBooked()));
            },
          ),
          TextButton(
            child: Text("finish page"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FinishPage()));
            },
          ),
          TextButton(
            child: Text("Mode Selection Page"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ModeSelectPage()));
            },
          ),
          TextButton(
            child: Text("Service Selection Page"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ServiceSelectionPage()));
            },
          ),
          TextButton(
            child: Text("Test Firebase"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TestFirescreen()));
            },
          ),
          TextButton(
            child: Text("Date page"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DatePage()));
            },
          ),
          TextButton(
            child: Text("Slot page"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SlotPage()));
            },
          ),
          TextButton(
            child: Text("Operator selection page"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OperatorSelectionScreen()));
            },
          ),
          TextButton(
            child: Text("book operator page"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookOperatorScreenScreen()));
            },
          )
        ],
      ),
    ));
  }
}

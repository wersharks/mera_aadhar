import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mera_aadhar/screens/login_type.dart';
import 'package:mera_aadhar/screens/verification.dart';
import 'package:mera_aadhar/services/auth/otp_signin.dart';
import 'package:mera_aadhar/utilities/constants.dart';
import 'package:mera_aadhar/screens/map_basic.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:mera_aadhar/fixtures/booking_fixture.dart';
import 'package:mera_aadhar/models/booking_model.dart';
import 'package:mera_aadhar/firebase/booking_db.dart';

import 'package:mera_aadhar/fixtures/operator_fixture.dart';
import 'package:mera_aadhar/models/operator_model.dart';
import 'package:mera_aadhar/firebase/operator_db.dart';

import 'package:flutter/foundation.dart';

class TestFirescreen extends StatelessWidget {
  const TestFirescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          TextButton(
            child: Text("Add dummy booking for ph 8872276957"),
            onPressed: () {
                debugPrint("init nwo dummy");
                Booking dummy = BookingFixture.dummyBooking();

                BookingDB bdb = new BookingDB();
                bdb.addNewBooking(dummy).then((value){
                    debugPrint("Successfully added booking!");
                });

            },
          ),
          TextButton(
            child: Text("Get current bookin"),
            onPressed: () {
                BookingDB bdb = new BookingDB();
                bdb.getMyCurrentBooking().then((value){
                    debugPrint("What!");
                    print(value);
                });
            },
          ),
          TextButton(
            child: Text("install surabhi as operator"),
            onPressed: () {
                OperatorDB odb = new OperatorDB();
                odb.addNewOperator(OperatorFixture.dummySurabhi()).then((value){
                    debugPrint("Added surabhi");
                });
            },
          ),
          TextButton(
            child: Text("get operators (multiple bruuuh) from center lat/long"),
            onPressed: () {
                String centerLatlong = "31.66525645-23.2554126";
                OperatorDB odp = new OperatorDB();
                odp.getOperatorsByLatLong(centerLatlong).then((lst){
                    print("Length lst " + lst.length.toString());
                });
            },
          ),
          TextButton(
            child: Text("get operator from operator id"),
            onPressed: () {
                int surabhiId = 42254; // DEBUG SURABHI ID IS THISSSS LETS MAKE HER WORK HARD AS OPERATOR

                OperatorDB odb = new OperatorDB();
                odb.getOperatorById(surabhiId).then((value){
                    debugPrint("Yea surab!");
                    print(value);
                });

            },
          ),
        ],
      ),
    ));

  }
}

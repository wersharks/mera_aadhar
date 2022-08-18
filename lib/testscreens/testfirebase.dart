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

import 'package:mera_aadhar/api/map_api.dart';

import 'package:flutter/foundation.dart';
import 'package:mera_aadhar/services/auth/operator_signin.dart';
import 'dart:async';
import 'package:mera_aadhar/models/operator_data_model.dart';

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
                String surabhiId = "abcdefgh"; // DEBUG SURABHI ID IS THISSSS LETS MAKE HER WORK HARD AS OPERATOR

                OperatorDB odb = new OperatorDB();
                odb.getOperatorById(surabhiId).then((value){
                    debugPrint("Yea surab!");
                    print(value);
                });

            },
          ),
          TextButton(
            child: Text("get nearby aadhar centers from fastapi"),
            onPressed: () {
              String lat = "30.360001";
              String lon = "76.452232";
              int rad = 10;
              fetchMapdata(lat, lon, rad).then((val){
                print(val.toJson());
              });
            },
          ),
          TextButton(
            child: Text("Dummy update operator loc data (realtime database)"),
            onPressed: () {
                String surabhiId = "abcdefgh";
                OperatorData odata = OperatorFixture.dummyOperatorData();
                odata.timestamp = DateTime.now().millisecondsSinceEpoch;
                OperatorDB odp = new OperatorDB();
                odp.setOperatorData(surabhiId, odata);
            },
          ),

          TextButton(
            child: Text("Subscribe operator live location (stream)"),
            onPressed: () {
              String surabhiId = "abcdefgh";
              OperatorDB odp = new OperatorDB();
              Stream<OperatorData> stream = odp.getOperatorLiveLocationById(surabhiId);
              StreamSubscription<OperatorData> subscriber = stream.listen((OperatorData data) {
                  print(data.toJson());
              },
              onError: (error) {
                  print(error);
              },
              onDone: () {
                  print('Stream closed!');
              });
            },
          ),
          TextButton(
            child: Text("login operator provider"),
            onPressed: () {
                Provider.of<OperatorAuth>(context,listen: false).setOperatorLogin("test1@test.com", "test1@test.com");
                Provider.of<OperatorAuth>(context,listen: false).oplogin(context);
            },
          ),
          TextButton(
            child: Text("logout provider"),
            onPressed: () {
                Provider.of<OperatorAuth>(context,listen: false).oplogout(context);
            },
          ),

        ],
      ),
    ));

  }
}

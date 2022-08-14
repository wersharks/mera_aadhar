import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test/integration_test.dart';

import 'package:mera_aadhar/main.dart' as app;
import 'package:firebase_core/firebase_core.dart';

import 'package:mera_aadhar/fixtures/booking_fixture.dart';
import 'package:mera_aadhar/models/booking_model.dart';
import 'package:mera_aadhar/firebase/booking_db.dart';
import 'package:flutter/foundation.dart';

Future<void> addDelay(int ms) async {
  await Future<void>.delayed(Duration(milliseconds: ms));
}


void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('Authentication Testing', (WidgetTester tester) async {
        await Firebase.initializeApp();

        debugPrint("init nwo dummy");
        Booking dummy = BookingFixture.dummyBooking();

        BookingDB bdb = new BookingDB();
        await bdb.addNewBooking(dummy);
        debugPrint("Successfully added booking!");
    });

}
import 'package:flutter/cupertino.dart';
import 'package:mera_aadhar/models/booking_model.dart';
import 'package:mera_aadhar/fixtures/booking_fixture.dart';
import 'package:mera_aadhar/widgets/time_tile.dart';

class BookingProvider extends ChangeNotifier {
  Booking booking = BookingFixture.dummyBooking();
  List<TimeTile> morning = [
   TimeTile(timeslot: '9:00 AM - 9:30 AM') ,
    TimeTile(timeslot:'9:30 AM - 10:00 AM'),
    TimeTile(timeslot:'10:00 AM - 10:30 AM'),
   TimeTile(timeslot: '10:30 AM - 11:00 AM'),
   TimeTile(timeslot: '11:00 AM - 11:30 AM'),
    TimeTile(timeslot:'11:30 AM - 12:00 PM')
  ];
   List<TimeTile> evening = [
 TimeTile(timeslot:  '2:00 PM - 2:30 PM'),
  TimeTile(timeslot:  '2:30 PM - 3:00 PM'),
    TimeTile(timeslot:'3:00 PM - 3:30 PM'),
    TimeTile(timeslot:'3:30 PM - 4:00 PM'),
   TimeTile(timeslot: '4:00 PM - 4:30 PM'),
    TimeTile(timeslot:'4:30 PM - 5:00 PM')
  ];
}

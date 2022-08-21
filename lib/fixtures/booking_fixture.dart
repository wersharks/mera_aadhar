import 'package:mera_aadhar/models/booking_model.dart';
import 'dart:convert';

class BookingFixture {
    static Booking dummyBooking(){
        Map<String, dynamic> data = jsonDecode('{"bookingId":2421,"operatorId":"abcdefgh","bookingType":0,"phoneNo":"+918872276957","bookingLocation":{"lat":23.25564,"lon":21.22134},"userdata":{"phoneNo":"+918872276957","type":0,"locationText":"Hostel O, Tiet"},"confirmOtp":4547,"paydata":{"type":"CASH","receipt":null,"status":"Success"},"bookingStatus":"Completed","slotTime":"4:15 AM","slotDate":"21 Aug 2022","timestamp":1660465314}');
        final Booking bookin = Booking.fromJson(data);
        return bookin;
    }

    Future<Booking?> fixture_booking_getMyCurrentBooking() async {
        return dummyBooking();
    }

    Future<Booking?> fixture_nobooking_getMyCurrentBooking() async {
        return null;
    }
}

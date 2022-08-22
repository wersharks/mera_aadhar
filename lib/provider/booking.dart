import 'package:flutter/cupertino.dart';
import 'package:mera_aadhar/fixtures/operator_fixture.dart';
import 'package:mera_aadhar/models/booking_model.dart';
import 'package:mera_aadhar/fixtures/booking_fixture.dart';
import 'package:mera_aadhar/models/operator_model.dart';
import 'package:mera_aadhar/widgets/time_tile.dart';

class BookingProvider extends ChangeNotifier {
  Booking booking = BookingFixture.dummyBooking();
  Operator focusOperator = OperatorFixture.dummySurabhi();
  bool isOpSelected = false;

  void setOperator(Operator op){
    isOpSelected = true;
    focusOperator = op;
    notifyListeners();
  }

  List<TimeTile> morning = [
    TimeTile(
      timeslot: '9:00 AM - 9:30 AM',
      index: 0,
      isSelected: false,
    ),
    TimeTile(
      timeslot: '9:30 AM - 10:00 AM',
      index: 1,
      isSelected: false,
    ),
    TimeTile(
      timeslot: '10:00 AM - 10:30 AM',
      index: 2,
      isSelected: false,
    ),
    TimeTile(
      timeslot: '10:30 AM - 11:00 AM',
      index: 3,
      isSelected: false,
    ),
    TimeTile(
      timeslot: '11:00 AM - 11:30 AM',
      index: 4,
      isSelected: false,
    ),
    TimeTile(
      timeslot: '11:30 AM - 12:00 PM',
      index: 5,
      isSelected: false,
    )
  ];
  List<TimeTile> evening = [
    TimeTile(
      timeslot: '2:00 PM - 2:30 PM',
      index: 0,
      isSelected: false,
    ),
    TimeTile(
      timeslot: '2:30 PM - 3:00 PM',
      index: 1,
      isSelected: false,
    ),
    TimeTile(
      timeslot: '3:00 PM - 3:30 PM',
      index: 2,
      isSelected: false,
    ),
    TimeTile(
      timeslot: '3:30 PM - 4:00 PM',
      index: 3,
      isSelected: false,
    ),
    TimeTile(
      timeslot: '4:00 PM - 4:30 PM',
      index: 4,
      isSelected: false,
    ),
    TimeTile(
      timeslot: '4:30 PM - 5:00 PM',
      index: 5,
      isSelected: false,
    )
  ];
  List<TimeTile> slots = [];
  void slotHandler(index) {
    for (int i = 0; i < 6; i++) {
      print(index);
      if (i != index) {
        slots[i].isSelected = false;
      }
      print(slots[i].isSelected);
    }
    notifyListeners();
  }

  void lodgeSlot() {
    for (int i = 0; i < 6; i++) {
      if (slots[i].isSelected = true) {
        booking.slotTime = slots[i].timeslot;
      }
    }
  }

  bool checkSlot() {
    int flag = 0;
    for (int i = 0; i < 6; i++) {
      if (slots[i].isSelected == false) flag++;
    }
    if (flag == 6)
      return false;
    else
      return true;
  }

  void cleanSlots() {
    for (int i = 0; i < 6; i++) {
      slots[i].isSelected = false;
    }
  }
}

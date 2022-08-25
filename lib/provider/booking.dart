import 'package:flutter/cupertino.dart';
import 'package:mera_aadhar/fixtures/operator_fixture.dart';
import 'package:mera_aadhar/models/booking_model.dart';
import 'package:mera_aadhar/fixtures/booking_fixture.dart';
import 'package:mera_aadhar/models/operator_model.dart';
import 'package:mera_aadhar/widgets/language_tile.dart';
import 'package:mera_aadhar/widgets/time_tile.dart';

class BookingProvider extends ChangeNotifier {
  Booking booking = BookingFixture.dummyBooking();
  Operator focusOperator = OperatorFixture.dummySurabhi();
  bool isOpSelected = false;
  String selectedLanguage = 'English';
  void setOperator(Operator op) {
    isOpSelected = true;
    focusOperator = op;
    notifyListeners();
  }

  void removeFocus() {
    isOpSelected = false;
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
  List<LanguageTile> languages = [
    LanguageTile(
      language: 'English',
      isLSelected: false,
      index: 0,
    ),
    LanguageTile(
      language: 'हिंदी',
      isLSelected: false,
      index: 1,
    ),
    LanguageTile(
      language: 'ਪੰਜਾਬੀ',
      isLSelected: false,
      index: 2,
    ),
    LanguageTile(
      language: 'తెలుగు',
      isLSelected: false,
      index: 3,
    ),
    LanguageTile(
      language: 'தமிழ்',
      isLSelected: false,
      index: 4,
    ),
    LanguageTile(
      language: 'বাংলা',
      isLSelected: false,
      index: 5,
    ),
    LanguageTile(
      language: 'मराठी',
      isLSelected: false,
      index: 6,
    ),
    LanguageTile(
      language: 'ગુજરાતી',
      isLSelected: false,
      index: 7,
    ),
    LanguageTile(
      language: 'ಕನ್ನಡ',
      isLSelected: false,
      index: 8,
    ),
    LanguageTile(
      language: 'മലയാളം',
      isLSelected: false,
      index: 9,
    ),
    LanguageTile(
      language: 'اُردُو',
      isLSelected: false,
      index: 10,
    )
  ];
  Map<String, String> languageToCode = {
    'English': 'en',
    'हिंदी': 'hi',
    'ਪੰਜਾਬੀ': 'pa',
    'বাংলা': 'bn',
    'ಕನ್ನಡ': 'kn',
    'മലയാളം': 'ml',
    'اُردُو': 'ur',
    'मराठी': 'mr',
    'ગુજરાતી': 'gu',
    'தமிழ்': 'ta',
    'తెలుగు': 'te'
  };
  List<TimeTile> slots = [];
  void slotHandler(index) {
    for (int i = 0; i < slots.length; i++) {
      print(index);
      if (i != index) {
        slots[i].isSelected = false;
      }
      print(slots[i].isSelected);
    }
    notifyListeners();
  }

  void languageHandler(index) {
    for (int i = 0; i < languages.length; i++) {
      print(index);
      if (i != index) {
        languages[i].isLSelected = false;
      }
      print(languages[i].isLSelected);
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

  void lodgeLanguage() {
    for (int i = 0; i < languages.length; i++) {
      if (languages[i].isLSelected = true) {
        selectedLanguage = languages[i].language;
      }
    }
  }

  bool checkLanguage() {
    int flag = 0;
    for (int i = 0; i < languages.length; i++) {
      if (languages[i].isLSelected == false) flag++;
    }
    if (flag == languages.length)
      return false;
    else
      return true;
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

  void cleanLanguages() {
    for (int i = 0; i < languages.length; i++) {
      languages[i].isLSelected = false;
    }
  }
}

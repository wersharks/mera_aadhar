import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
import 'package:mera_aadhar/provider/booking.dart';
import 'package:mera_aadhar/screens/slot_page.dart';
import 'package:provider/provider.dart';

import '../services/snackbar.dart';

class DatePage extends StatefulWidget {
  const DatePage({Key? key}) : super(key: key);

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  DateTime? realDate;
  DateTime? dynamicDate;
  DateTime date = DateTime.now();
  String? slotType;
  bool isMorningSlot = true;
  @override
  void initState() {
    print("init called00");
    bool flag = false;
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime =
        dateFormat.parse('${date.year}-${date.month}-${date.day} 17:00:00');
    DateTime dateTime1 =
        dateFormat.parse('${date.year}-${date.month}-${date.day} 12:00:00');
    if (date.isAfter(dateTime)) {
      realDate = date.add(Duration(days: 1));
      dynamicDate = realDate;
      flag = true;
    } else {
      realDate = date;
      dynamicDate = realDate;
    }

    if (date.isAfter(dateTime1) && flag == false) {
      isMorningSlot = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.arrow_forward,
              size: 30,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Color(0xffF8774A), Color(0xffF8774A)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft))),
        onPressed: () {
          (slotType == 'morning')
              ? Provider.of<BookingProvider>(context, listen: false).slots =
                  Provider.of<BookingProvider>(context, listen: false).morning
              : Provider.of<BookingProvider>(context, listen: false).slots =
                  Provider.of<BookingProvider>(context, listen: false).evening;
          Provider.of<BookingProvider>(context, listen: false).booking.date =
              dynamicDate;
          print(dynamicDate);
          print(Provider.of<BookingProvider>(context, listen: false)
              .booking
              .userdata!
              .type);
          if (slotType == 'morning' || slotType == 'evening')
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SlotPage()));
          else
            showSnackBar('Please select any option to continue', context);
        },
      ),
      //  backgroundColor: Color(0xFFFF4B3A),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFF4B3A), Color(0xFFF2F2F2), Color(0xFFF2F2F2)],
            stops: [0.33, 0.33, 0.33],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40,
                child: Image.asset(
                  'assets/aadharlogo.png',
                  width: 55,
                  height: 55,
                ),
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 700,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 220,
                          width: 360,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Select Date and Time',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  DateFormat.yMMMMd('en_US')
                                      .format(dynamicDate!)
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22,
                                        color: Color(0xFFFF460A)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: RawScrollbar(
                                    thickness: 3,
                                    // trackVisibility: true,
                                    // trackBorderColor: Color(0xFFF2F2F2),
                                    // trackColor: Color(0xFFF2F2F2),
                                    thumbColor: Color(0xFFFF460A),
                                    isAlwaysShown: true,
                                    child: DatePicker(
                                      realDate!,
                                      initialSelectedDate: realDate,
                                      daysCount: 15,
                                      onDateChange: (value) {
                                        dynamicDate = value;
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (isMorningSlot == true) {
                            if (slotType == null || slotType != 'morning')
                              slotType = 'morning';
                            else
                              slotType = '';
                          }
                          setState(() {});
                        },
                        child: Container(
                          height: 220,
                          width: 360,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color:
                                  (isMorningSlot) ? Colors.white : Colors.grey),
                          child: Center(
                            child: Column(
                              children: [
                                (slotType != null && slotType == 'morning')
                                    ? Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Image.asset(
                                            'assets/checked.png',
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 50,
                                      ),
                                Container(
                                  child: Image.asset(
                                    'assets/morning.png',
                                    width: 72,
                                    height: 72,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Morning Slots',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 30,
                                        color: Color(0xFFFF460A)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (slotType == null || slotType != 'evening')
                            slotType = 'evening';
                          else
                            slotType = '';

                          setState(() {});
                        },
                        child: Container(
                          height: 220,
                          width: 360,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: Center(
                            child: Column(
                              children: [
                                (slotType != null && slotType == 'evening')
                                    ? Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Image.asset(
                                            'assets/checked.png',
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 50,
                                      ),
                                Container(
                                  child: Image.asset(
                                    'assets/evening.png',
                                    width: 72,
                                    height: 72,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Evening Slots',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 30,
                                        color: Color(0xFFFF460A)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

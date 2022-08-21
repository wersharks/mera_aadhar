import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
import 'package:mera_aadhar/provider/booking.dart';
import 'package:mera_aadhar/widgets/time_tile.dart';
import 'package:provider/provider.dart';

class SlotPage extends StatefulWidget {
  const SlotPage({Key? key}) : super(key: key);

  @override
  State<SlotPage> createState() => _SlotPageState();
}

class _SlotPageState extends State<SlotPage> {
  List<TimeTile> slots=[];
  @override
  Widget build(BuildContext context) {
    if(Provider.of<BookingProvider>(context,listen:false).booking.slotType=='morning')
    slots=Provider.of<BookingProvider>(context,listen:false).morning;
    else if(Provider.of<BookingProvider>(context,listen:false).booking.slotType=='evening')
    slots=Provider.of<BookingProvider>(context,listen:false).evening;
    return Scaffold(
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
                  width: 35,
                  height: 35,
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
                                      const Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.black,
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
                                      .format(Provider.of<BookingProvider>(context, listen: false).booking.date!).toString(),
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
                                      Provider.of<BookingProvider>(context, listen: false).booking.date!,
                                      daysCount: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(

                        child:ListView(
                          children:
                        slots
                        
                        )
                      )
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

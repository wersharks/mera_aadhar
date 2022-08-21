import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mera_aadhar/provider/booking.dart';
import 'package:provider/provider.dart';

class TimeTile extends StatefulWidget {
  String timeslot;
  bool isSelected;
  int index;
  TimeTile(
      {required this.timeslot, this.isSelected = false, required this.index});

  @override
  State<TimeTile> createState() => _TimeTileState();
}

class _TimeTileState extends State<TimeTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
      child: GestureDetector(
        onTap: () {
          if (widget.isSelected == false) {
            widget.isSelected = true;
            Provider.of<BookingProvider>(context, listen: false)
                .slots[widget.index]
                .isSelected = true;
          } else {
            widget.isSelected = false;
             Provider.of<BookingProvider>(context, listen: false)
                .slots[widget.index]
                .isSelected = false;
          }

          setState(() {});
          Provider.of<BookingProvider>(context, listen: false)
              .slotHandler(widget.index);
          print(Provider.of<BookingProvider>(context, listen: false)
                .slots[widget.index]
                .isSelected);
        },
        child: Container(
          height: 68,
          width: 360,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/time.png',
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.timeslot,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      if (widget.isSelected)
                        Image.asset(
                          'assets/checked.png',
                          width: 30,
                          height: 30,
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

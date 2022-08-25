import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mera_aadhar/provider/booking.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';
class LanguageTile extends StatefulWidget {
  String language;
  bool isLSelected;
  int index;
  LanguageTile(
      {required this.language, this.isLSelected = false, required this.index});

  @override
  State<LanguageTile> createState() => _LanguageTileState();
}

class _LanguageTileState extends State<LanguageTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15),
      child: GestureDetector(
        onTap: () {
          if (widget.isLSelected == false) {
            widget.isLSelected = true;
            Provider.of<BookingProvider>(context, listen: false)
                .languages[widget.index]
                .isLSelected = true;
          } else {
            widget.isLSelected = false;
            Provider.of<BookingProvider>(context, listen: false)
                .languages[widget.index]
                .isLSelected = false;
          }

          setState(() {});
          Provider.of<BookingProvider>(context, listen: false)
              .languageHandler(widget.index);
          print(Provider.of<BookingProvider>(context, listen: false)
              .languages[widget.index]
              .isLSelected);
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
                    children: [
                      if (widget.isLSelected)
                        Image.asset(
                          'assets/checked.png',
                          width: 30,
                          height: 30,
                        ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.language,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Colors.black),
                        ),
                      ),
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

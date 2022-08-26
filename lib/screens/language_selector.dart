import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mera_aadhar/language_handler.dart';
import 'package:mera_aadhar/provider/booking.dart';
import 'package:mera_aadhar/screens/modeSelectionPage.dart';
import 'package:mera_aadhar/screens/onBoardingPage.dart';
import 'package:mera_aadhar/utilities/constants.dart';
import 'package:mera_aadhar/widgets/language_tile.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../services/snackbar.dart';
import 'welcomePage.dart';
import 'dart:async';

class LanguageSelectorScreen extends StatefulWidget {
  const LanguageSelectorScreen({Key? key}) : super(key: key);

  @override
  State<LanguageSelectorScreen> createState() => _LanguageSelectorScreenState();
}

class _LanguageSelectorScreenState extends State<LanguageSelectorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          onPressed: ()async {
            if (Provider.of<BookingProvider>(context, listen: false)
                .checkLanguage()) {
              Provider.of<BookingProvider>(context, listen: false)
                  .lodgeLanguage();
              Provider.of<BookingProvider>(context, listen: false)
                  .cleanLanguages();
              await superTranslate(context);
              Future.delayed(Duration(milliseconds: 1500), () {
   Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => OnBoardingScreen()));
});
             
            } else {
              showSnackBar('Please select any slot to continue', context);
            }
          },
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.arrow_forward,
            color: Color(0xFFFF4B3A),
          ),
        ),
      ),
      backgroundColor: Color(0xFFFF4B3A),
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: Image.asset(
                'assets/logooo.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Select a language',
            style: GoogleFonts.nunito(
              textStyle: TextStyle(fontSize: 33, color: Colors.white),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount:
                      Provider.of<BookingProvider>(context).languages.length,
                  itemBuilder: (context, index) {
                    return LanguageTile(
                      language: Provider.of<BookingProvider>(context)
                          .languages[index]
                          .language,
                      index: index,
                      isLSelected: Provider.of<BookingProvider>(context)
                          .languages[index]
                          .isLSelected,
                    );
                  }
                  //

                  )),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

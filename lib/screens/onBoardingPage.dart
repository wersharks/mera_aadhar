import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mera_aadhar/language_handler.dart';
import 'package:mera_aadhar/screens/modeSelectionPage.dart';
import 'package:mera_aadhar/utilities/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'welcomePage.dart';
import 'dart:async';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;
  Timer _timer = Timer(const Duration(seconds: 5), () {});
  final PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
if(_controller.hasClients)
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
    print('here');
    print(translatedStrings["aadharUpdationOrEnrollmentAtYourHome"]);
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF4B3A),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => ModeSelectPage()));
                  },
                  child: Text(
                    "SKIP >>",
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
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
          SizedBox(
            height: 500,
            child: PageView(
              onPageChanged: (value) {
                _currentPage = value;

                setState(() {});
              },
              controller: _controller,
              children: [
                WelcomeScreen(
                  vectorLink: "assets/card.png",
                  //  textelement: "Aadhar updation or Enrollment at your home",
                  textelement:
                      translatedStrings["aadharUpdationOrEnrollmentAtYourHome"].toString(),
                ),
                WelcomeScreen(
                  vectorLink: "assets/time.png",
                  textelement: translatedStrings["selectYourOwnTimeSlot&Operator"].toString(),
                ),
                WelcomeScreen(
                  vectorLink: "assets/review.png",
                  textelement: translatedStrings["reviewYourAppointments"].toString(),
                )
              ],
            ),
          ),
          if (_currentPage != 2)
            Container(
              alignment: const Alignment(0, 0.75),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                    dotWidth: 10.0,
                    dotHeight: 10.0,
                    activeDotColor: Colors.white,
                    dotColor: Color(0xFFFF855D)),
              ),
            ),
          if (_currentPage == 2)
            SizedBox(
              width: 325,
              height: 68,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => ModeSelectPage()));
                  },
                  style: buttonStyle.copyWith(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  child: Text(
                    'Get Started',
                    style: kPoppinWhite.copyWith(color: Color(0xffFF460A)),
                  )),
            )
        ],
      ),
    );
  }
}

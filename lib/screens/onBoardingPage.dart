import 'package:flutter/material.dart';
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
  Timer _timer = Timer(const Duration(seconds: 5), () { });
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

      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF4B3A),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 65,
              child: Image.asset(
                'assets/aadharlogo.png',
                width: 80,
                height: 80,
              ),
            ),
          ),
          SizedBox(
            height: 500,
            child: PageView(
              controller: _controller,
              children: [
                WelcomeScreen(vectorLink: "", textelement: "Aaadhar update or Enrollment at your home",),
                WelcomeScreen(vectorLink: "", textelement: "Select your own Time Slot",),
                WelcomeScreen(vectorLink: "", textelement: "Review your appointments",)
              ],
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                  dotWidth:  10.0,
                  dotHeight:  10.0,
                  activeDotColor: Colors.white,
                  dotColor: Color(0xFFFF855D)
              ),
            ),
          )
        ],
      ),
    );
  }
}

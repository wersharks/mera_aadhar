import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  final String vectorLink;
  final String textelement;

  WelcomeScreen(
      {required this.vectorLink,
      required this.textelement});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFF4B3A),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: Center(
                child: Text(
                  textelement,
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(fontSize: 45, color: Colors.white),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 4,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 160,
              width: 160,
              child: Image.asset('assets/card.png'),
            ),
          ],
        ),
      ),
    );
  }
}

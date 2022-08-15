import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final int currentPage;
  final String vectorLink;
  final String textelement;

  WelcomeScreen(
      {required this.currentPage,
      required this.vectorLink,
      required this.textelement});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFF4B3A),
      child: Center(
        child: Column(
          children: [
            if (currentPage == 3)
              (Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 70,
                      width: 314,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: const Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFFFF460A)),
                        ),
                      ),
                    ),
                  ),
                ),
              ))
          ],
        ),
      ),
    );
  }
}

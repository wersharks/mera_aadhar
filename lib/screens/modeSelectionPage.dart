import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mera_aadhar/screens/verification.dart';
import 'package:url_launcher/url_launcher.dart';

class ModeSelectPage extends StatefulWidget {
  const ModeSelectPage({Key? key}) : super(key: key);

  @override
  State<ModeSelectPage> createState() => _ModeSelectPageState();
}

class _ModeSelectPageState extends State<ModeSelectPage> {
  @override
  void call(String tel) async {
    try {
      await launch(tel);
    } catch (_e) {
      print(_e);
    }
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
              decoration: const BoxDecoration(
                color: Color(0xFFF2F2F2),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
              ),
              width: MediaQuery.of(context).size.width,
              height: 700,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Verification()));
                      },
                      child: Container(
                        height: 220,
                        width: 390,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Container(
                                child: Image.asset(
                                  'assets/operatoricon.png',
                                  width: 72,
                                  height: 72,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Book Operator',
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
                      onTap: () async {
                        call('tel:1947');
                      },
                      child: Container(
                        height: 220,
                        width: 390,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Container(
                                child: Image.asset(
                                  'assets/helpline.png',
                                  width: 72,
                                  height: 72,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Use Helpline',
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
                        call(
                            'https://uidai.gov.in/my-aadhaar/update-aadhaar.html');
                      },
                      child: Container(
                        height: 220,
                        width: 390,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Container(
                                child: Image.asset(
                                  'assets/self-service.png',
                                  width: 72,
                                  height: 72,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Self Update',
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
    );
  }
}

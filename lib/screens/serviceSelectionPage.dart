import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class ServiceSelectionPage extends StatefulWidget {
  const ServiceSelectionPage({Key? key}) : super(key: key);

  @override
  State<ServiceSelectionPage> createState() => _ServiceSelectionPageState();
}

class _ServiceSelectionPageState extends State<ServiceSelectionPage> {
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
                      onTap: (){},
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
                                  'assets/card.png',
                                  width: 72,
                                  height: 72,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'New Application',
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
                      onTap: (){},
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
                                  'assets/fingerprint.png',
                                  width: 72,
                                  height: 72,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Update Information',
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
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){},
                            child: Container(
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
                                        'assets/senior.png',
                                        width: 72,
                                        height: 72,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Senior Citizen',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: Color(0xFFFF460A)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 58,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){},
                            child: Container(
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
                                        'assets/disable.png',
                                        width: 72,
                                        height: 72,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Physically Disabled',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 19,
                                            color: Color(0xFFFF460A)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 58,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
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

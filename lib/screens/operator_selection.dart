import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class OperatorSelectionScreen extends StatefulWidget {
  const OperatorSelectionScreen({Key? key}) : super(key: key);

  @override
  State<OperatorSelectionScreen> createState() =>
      _OperatorSelectionScreenState();
}

class _OperatorSelectionScreenState extends State<OperatorSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF4B3A),
      body: SlidingUpPanel(
        maxHeight: 280,
        minHeight: 150,
        backdropEnabled: true,
        color: Colors.transparent,
        panel: Container(
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.arrow_drop_up_outlined,
                size: 40,
              ),
              ListTile(
                leading: const Icon(
                  Icons.house,
                  color: Colors.black,
                  size: 36,
                ),
                title: Text(
                  'B-116 Hostel C, Thapar University Patiala',
                  style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                subtitle: Text(
                  'Mobile Number: 9305895903',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFB2B2B2),
                      fontSize: 16),
                ),
                trailing: Icon(Icons.edit),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 70,
                width: 315,
                decoration: BoxDecoration(
                    color: Color(0xFFF8774A),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    'Select an operator for yourself',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: Color(0xFFF4F4F4),
                radius: 40,
                child: Image.asset(
                  'assets/aadharlogo.png',
                  width: 35,
                  height: 35,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 600,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: SizedBox(
                          width: 140,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                              Text(
                                'Appointments',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

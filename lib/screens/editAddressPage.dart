import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class EditAddressPage extends StatefulWidget {
  const EditAddressPage({Key? key}) : super(key: key);

  @override
  State<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  height: 684,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 330,
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ),
                            Text(
                              'My Map',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Color(0xFFF4F4F4),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              children: const [
                                Icon(Icons.search),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Search Location',
                                    ),
                                    textInputAction: TextInputAction.done,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.black,
                          ),
                          title: Text(
                            'Current Location',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                          subtitle: Text(
                            'B-116 Hostel C, Thapar University Patiala',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB2B2B2),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          title: Text(
                            'Look up the map',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
    ;
  }
}

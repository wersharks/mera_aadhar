import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';

class opmap extends StatefulWidget {
  const opmap({Key? key}) : super(key: key);

  @override
  State<opmap> createState() => _MapIntroductionPageState();
}

class _MapIntroductionPageState extends State<opmap> {
  @override
  void initState() {
    super.initState();
  }

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
                  'Updation:          Slot:1pm-2pm',
                  style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                subtitle: Text(
                  'B-169, C Hostel Thapar University,Patiala, Punjab',
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
                    'Confirmation OTP',
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
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                      child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 600,
                      child: MapmyIndiaMap(
                        initialCameraPosition: CameraPosition(  
                          target: LatLng(25.321684, 82.987289),  
                          zoom: 14.0,  
                        ),  
                        onMapCreated: (map) =>  
                        {  
                          // mapController = map,
                        },
                      ),
                    ),
                  ),
                  // child: Container(
                  //   decoration: const BoxDecoration(
                  //     color: Color(0xFFF2F2F2),
                  //     borderRadius: BorderRadius.only(
                  //         topRight: Radius.circular(30),
                  //         topLeft: Radius.circular(30)),
                  //   ),
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 600,
                  //   child: MapmyIndiaMap(
                  //     initialCameraPosition: CameraPosition(  
                  //       target: LatLng(25.321684, 82.987289),  
                  //       zoom: 14.0,  
                  //     ),  
                  //     onMapCreated: (map) =>  
                  //     {  
                  //       // mapController = map,
                  //     },
                  //   ),
                  // ),
                ),
                GestureDetector(
                  onTap: (){},
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
                        child: Text(
                          'Edit Location',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
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



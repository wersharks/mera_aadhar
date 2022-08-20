import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mera_aadhar/provider/booking.dart';
import 'package:mera_aadhar/screens/documentCheckPage.dart';
import 'package:mera_aadhar/services/snackbar.dart';
import 'package:provider/provider.dart';

class ServiceSelectionPage extends StatefulWidget {
  const ServiceSelectionPage({Key? key}) : super(key: key);

  @override
  State<ServiceSelectionPage> createState() => _ServiceSelectionPageState();
}

class _ServiceSelectionPageState extends State<ServiceSelectionPage> {
  @override
  String? bookingType;
  List<String> extraAbility = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.arrow_forward,
              size: 30,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Color(0xffF8774A), Color(0xffF8774A)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft))),
        onPressed: () {
          (bookingType == 'update')
              ? Provider.of<BookingProvider>(context, listen: false)
                  .booking
                  .bookingType = 0
              : Provider.of<BookingProvider>(context, listen: false)
                  .booking
                  .bookingType = 1;
          if (extraAbility == null)
            Provider.of<BookingProvider>(context, listen: false)
                .booking
                .userdata!
                .type = 0;
          else if (extraAbility.contains('senior') &&
              extraAbility.contains('phydisabled'))
            Provider.of<BookingProvider>(context, listen: false)
                .booking
                .userdata!
                .type = 3;
          else if (extraAbility.contains('senior'))
            Provider.of<BookingProvider>(context, listen: false)
                .booking
                .userdata!
                .type = 2;
          else if (extraAbility.contains('phydisabled'))
            Provider.of<BookingProvider>(context, listen: false)
                .booking
                .userdata!
                .type = 1;
          Provider.of<BookingProvider>(context, listen: false)
              .booking
              .userdata!
              .phoneNo = FirebaseAuth.instance.currentUser!.phoneNumber;
print(Provider.of<BookingProvider>(context, listen: false)
              .booking.bookingType);
          print(Provider.of<BookingProvider>(context, listen: false)
              .booking.userdata!.type);
          if (bookingType == 'new' || bookingType == 'update')
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DocumentCheckPage()));
          else
            showSnackBar('Please select any option to continue', context);
        },
      ),
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
                      onTap: () {
                        if (bookingType == null || bookingType != 'new')
                          bookingType = 'new';
                        else
                          bookingType = '';

                        setState(() {});
                      },
                      child: Container(
                        height: 200,
                        width: 390,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Center(
                          child: Column(
                            children: [
                              (bookingType != null && bookingType == 'new')
                                  ? Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(
                                          'assets/checked.png',
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                    )
                                  : SizedBox(
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
                      onTap: () {
                        if (bookingType == null || bookingType != 'update')
                          bookingType = 'update';
                        else
                          bookingType = '';
                        setState(() {});
                      },
                      child: Container(
                        height: 200,
                        width: 390,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Center(
                          child: Column(
                            children: [
                              (bookingType != null && bookingType == 'update')
                                  ? Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(
                                          'assets/checked.png',
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                    )
                                  : SizedBox(
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Choose if you are senior citizen or physically disabled, otherwise go ahead.',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (extraAbility == null ||
                                  !extraAbility.contains('senior'))
                                extraAbility.add('senior');
                              else
                                extraAbility.remove('senior');
                              print(extraAbility);
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white),
                              child: Center(
                                child: Column(
                                  children: [
                                    (extraAbility != null &&
                                            extraAbility.contains('senior'))
                                        ? Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Image.asset(
                                                'assets/checked.png',
                                                width: 30,
                                                height: 30,
                                              ),
                                            ),
                                          )
                                        : SizedBox(
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
                                      height: 40,
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
                            onTap: () {
                              if (extraAbility == null ||
                                  !extraAbility.contains('phydisabled'))
                                extraAbility.add('phydisabled');
                              else
                                extraAbility.remove('phydisabled');

                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white),
                              child: Center(
                                child: Column(
                                  children: [
                                    (extraAbility != null &&
                                            extraAbility
                                                .contains('phydisabled'))
                                        ? Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Image.asset(
                                                'assets/checked.png',
                                                width: 30,
                                                height: 30,
                                              ),
                                            ),
                                          )
                                        : SizedBox(
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
                                      height: 40,
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

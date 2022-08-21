import 'dart:ffi';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mera_aadhar/screens/MapIntroductionPage.dart';
import 'package:mera_aadhar/screens/date_page.dart';
import 'package:mera_aadhar/screens/operator_selection.dart';
import 'package:mera_aadhar/services/snackbar.dart';
import 'package:mera_aadhar/utilities/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentCheckPage extends StatefulWidget {
  const DocumentCheckPage({Key? key}) : super(key: key);

  @override
  State<DocumentCheckPage> createState() => _DocumentCheckPageState();
}

class _DocumentCheckPageState extends State<DocumentCheckPage> {
  bool poi = false;
  bool poa = false;
  bool por = false;
  bool dob = false;
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
              height: 50,
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
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Keep With yourself",
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 70,
              width: 315,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: CheckboxListTile(
                  value: poi,
                  onChanged: (val) {
                    setState(() {
                      poi = val!;
                    });
                  },
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  title: Text(
                    'Proof of Identity',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.black)),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              width: 315,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: CheckboxListTile(
                  value: poa,
                  onChanged: (val) {
                    setState(() {
                      poa = val!;
                    });
                  },
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  title: Text(
                    'Proof of Address',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.black)),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              width: 315,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: CheckboxListTile(
                  value: por,
                  onChanged: (val) {
                    setState(() {
                      por = val!;
                    });
                  },
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  title: Text(
                    'Proof of Relationship',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.black)),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              width: 315,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: CheckboxListTile(
                  value: dob,
                  onChanged: (val) {
                    setState(() {
                      dob = val!;
                    });
                  },
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  title: Text(
                    'Date of Birth',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.black)),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                call(
                    'https://uidai.gov.in/images/commdoc/List_of_Acceptable_documents_July2022.pdf');
              },
              child: Text(
                'Click here for more information about the document needed.',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(fontSize: 20, color: Colors.white),
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        floatingActionButton: SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            onPressed: () {
              if (poi && poa && por && dob)
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OperatorSelectionScreen()));
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => DatePage()));
                    // MaterialPageRoute(
                    //     builder: (context) => MapIntroductionPage()));

              else
                showSnackBar(
                    'Please check all the documents to continue', context);
            },
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.arrow_forward,
              color: Color(0xFFFF4B3A),
            ),
          ),
        ));
  }
}

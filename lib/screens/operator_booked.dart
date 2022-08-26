import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mera_aadhar/firebase/booking_db.dart';
import 'package:mera_aadhar/language_handler.dart';
import 'package:mera_aadhar/provider/booking.dart';
import 'package:mera_aadhar/screens/finish_page.dart';
import 'package:mera_aadhar/utilities/constants.dart';
import 'package:mera_aadhar/utilities/size_config.dart';
import 'package:mera_aadhar/widgets/my_card.dart';
import 'package:mera_aadhar/widgets/operator_booked_card.dart';
import 'package:provider/provider.dart';

class OperatorBooked extends StatefulWidget {
  const OperatorBooked({Key? key}) : super(key: key);

  @override
  State<OperatorBooked> createState() => _OperatorBookedState();
}

class _OperatorBookedState extends State<OperatorBooked> {
  @override
  void initState() {
    // int bookingId = Provider.of<BookingProvider>(context, listen: false).booking.bookingId!;
    // print("book id completed $bookingId");
    // var bdb = BookingDB();
    // bdb.registerForBookingCompleted(bookingId, (){
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FinishPage()));});

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          int bookingId = Provider.of<BookingProvider>(context, listen: false).booking.bookingId!;
          print("book id completed $bookingId");
          var bdb = BookingDB();
          bdb.registerForBookingCompleted(bookingId, (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FinishPage()));});
    });

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfig().init(context);
  }

    void cancelCurrentBookingAndExit() async {
      print("cancel");
      // TODO: Implement here
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      extendBodyBehindAppBar: true,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: getProportionateScreenHeight(270),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.1),
                    offset: Offset(0, 0),
                    spreadRadius: .1,
                    blurRadius: 15),
              ],
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              // border: Border.all(color: Colors.grey.withOpacity(.01))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(1),
                ),
                Center(
                  child: Image.asset(
                    'assets/aadharlogo.png',
                    width: getProportionateScreenWidth(125),
                    height: getProportionateScreenHeight(112),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        translatedStrings["operatorBooked"].tostring(),
                        style: textStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(100),
                      child: Divider(
                        thickness: 3,
                        color: Color(0xffFA4A0C),
                        height: getProportionateScreenHeight(4),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                translatedStrings["yourOperator"].tostring(),
                style: oTextStyle,
              ),
            ),
          ),
          Consumer<BookingProvider>(
            builder: (context, provider, child) {
              return OperatorBookedCard(
              name: provider.focusOperator.name!,
              phoneNo: provider.focusOperator.phoneNo!,
              rating: provider.focusOperator.ratings!,
              task: provider.booking.bookingType! == 0 ? 'Aadhar Updation' : 'Aadhar Enrollment',
              time: provider.booking.slotTime!);
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Confirmation OTP',
            style: oTextStyle.copyWith(fontWeight: FontWeight.normal),
          ),
          Consumer<BookingProvider>(
            builder: (context, provider, child) {
              return Text(
                provider.booking.confirmOtp!,
                style: oTextStyle.copyWith(fontWeight: FontWeight.bold),
              );
            },
          ),

          
          SizedBox(
            height: 55,
          ),
          SizedBox(
              width: 350,
              height: getProportionateScreenHeight(60),
              child: TextButton(
                  style: buttonStyle,
                  onPressed: () async {
                    cancelCurrentBookingAndExit();
                  },
                  child: Text(
                    translatedStrings["cancel"].toString(),
                    style: buttonTextStyle,
                  )
                )
            ),
        ],
      )),
    );
  }
}

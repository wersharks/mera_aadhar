import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mera_aadhar/models/booking_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookingDB {

CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('bookings');

    Future<void> addNewBooking(Booking booking) {
      return _collectionRef
          .add(booking.toJson())
          .then((value) => print("Booking entry added"))
          .catchError((error) => print("Failed to add entry: $error"));
    }

    Future<Booking?> getMyCurrentBooking() async {
        FirebaseAuth auth = FirebaseAuth.instance;

        print("my ph "+(auth.currentUser?.phoneNumber)!);

        QuerySnapshot snap = await _collectionRef
                                    .where('phoneNo', isEqualTo: auth.currentUser?.phoneNumber)
                                    .orderBy('timestamp', descending: true)
                                    .limit(1)
                                    .get();

        if(snap.size != 0){
            Booking b = Booking.fromJson(snap.docs[0].data() as Map<String, dynamic>);
            if(b.bookingStatus! != "Completed") return b;
            else return null;
        } 
        else return null;
    }


    void registerForBookingCompleted(int bookingId, Function() f) async {
      print("okay regis $bookingId");
        _collectionRef
          .where('bookingId', isEqualTo: bookingId)
          // .orderBy('timestamp', descending: true)
          .snapshots()
          .listen((QuerySnapshot querySnapshot){
              Booking b = Booking.fromJson(querySnapshot.docs[0].data() as Map<String, dynamic>);
              if(b.bookingStatus! == "Completed"){
                print("Okay, success");
                f();
              }
            }
          );
    }

    Future<List<Booking>> getOperatorIdBooking(String oId) async {
        FirebaseAuth auth = FirebaseAuth.instance;
        QuerySnapshot snap = await _collectionRef
                                    .where('operatorId', isEqualTo: oId)
                                    .orderBy('timestamp', descending: true)
                                    .get();

        List<Booking> bookins = [];
        for(int i=0; i<snap.size; i++){
            Booking b = Booking.fromJson(snap.docs[i].data() as Map<String, dynamic>);
            if(b.bookingStatus! == "Completed") continue;
            bookins.add(b);
        }

        return bookins;
    }


}
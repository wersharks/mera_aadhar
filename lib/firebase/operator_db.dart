import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mera_aadhar/models/operator_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OperatorDB {

CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('operators');

    Future<void> addNewOperator(Operator booking) {
        // TODO: UNSAFE/TESTING ONLY
      return _collectionRef
          .add(booking.toJson())
          .then((value) => print("Operator entry added"))
          .catchError((error) => print("Failed to add entry: $error"));
    }

    Future<Operator?> getOperatorById(int operatorId) async {
        QuerySnapshot snap = await _collectionRef
                                    .where('operatorId', isEqualTo: operatorId)
                                    .limit(1)
                                    .get();

        if(snap.size != 0){
            Operator b = Operator.fromJson(snap.docs[0].data() as Map<String, dynamic>);
            if(b.isOperatorActive! != false) return b;
            else return null;
        } 
        else return null;
    }

    Future<List<Operator>> getOperatorsByLatLong(String latlong) async {
        QuerySnapshot snap = await _collectionRef
                                    .where('centerLocation', isEqualTo: latlong)
                                    .get();

        List<Operator> operators = [];

        snap.docs.forEach((doc){
            Operator op = Operator.fromJson(doc.data() as Map<String, dynamic>);
            if(op.isOperatorActive!){
                operators.add(op);
            }
        });

        return operators;
    }

}
import 'package:mera_aadhar/models/operator_model.dart';
import 'package:mera_aadhar/models/operator_data_model.dart';
import 'dart:convert';

class OperatorFixture {
    static Operator dummySurabhi(){
        Map<String, dynamic> data = jsonDecode('{"operatorId":"abcdefgh","centerLocation":"31.66525645-23.2554126","name":"Surabhi Misra","picture":"","age":18,"gender":"Female","phoneNo":"+91123456789","email":"surabhi@gmail.com","ratings":"4.5","reviews":["Good work","She is very hardworking operator","quickly resolved my services"],"isOperatorActive":true,"timestamp":1660465314}');
        final Operator surabhi = Operator.fromJson(data);
        return surabhi;
    }

    static OperatorData dummyOperatorData(){
        Map<String, dynamic> data = jsonDecode('{"operatorId":"abcdefgh","loc":{"lat":23.25564,"lon":25.21123},"nextServingId":2524,"timestamp":1660465314}');
        final OperatorData surabhiData = OperatorData.fromJson(data);
        return surabhiData;
    }
}

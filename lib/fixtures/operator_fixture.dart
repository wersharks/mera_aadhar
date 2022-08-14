import 'package:mera_aadhar/models/operator_model.dart';
import 'dart:convert';

class OperatorFixture {
    static Operator dummySurabhi(){
        Map<String, dynamic> data = jsonDecode('{"operatorId":42254,"centerLocation":"31.66525645-23.2554126","name":"Surabhi Misra","picture":"","age":18,"gender":"Female","phoneNo":"+91123456789","email":"surabhi@gmail.com","ratings":"4.5","reviews":["Good work","She is very hardworking operator","quickly resolved my services"],"isOperatorActive":true,"timestamp":1660465314}');
        final Operator surabhi = Operator.fromJson(data);
        return surabhi;
    }

}

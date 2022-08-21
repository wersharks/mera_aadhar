import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mera_aadhar/models/operator_model.dart';
import 'package:mera_aadhar/models/operator_data_model.dart';
import 'package:mera_aadhar/models/nearby_api_model.dart';
import 'package:mera_aadhar/fixtures/nearby_center_fixture.dart';

import 'package:mera_aadhar/firebase/operator_db.dart';
import 'package:async/async.dart' show StreamGroup;
import 'dart:developer';
import 'package:geocode/geocode.dart';

const API_ENDPOINT = "http://65.1.248.34:8080/";

Future<NearbyApiResponse> fetchMapdata(String lat, String lon, int rad) async {
  final response = await http
      .get(Uri.parse(API_ENDPOINT + "aadhar/nearby?x=$lat&y=$lon&radius=$rad"));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return NearbyApiResponse.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load nearby aadhar centers!');
  }
}


Future<NearbyApiResponse> fetchMapdataFixture(String lat, String lon, int rad) async {
  return NearbyApiFixture.dummyNearbyApi();
}

Future<String?> getAddressByLatLon(double lat, double lng) async{
  GeoCode geoCode = GeoCode();
  Address address = await geoCode.reverseGeocoding(latitude: lat, longitude: lng);
  print(address.toString());
  return "${address.streetAddress}, ${address.region}, ${address.postal},";
}

Future<StreamGroup<OperatorData>> getAllOperatorsByMyLatLong(String lat, String lon) async{
  int rad = 5;
  NearbyApiResponse nearby = await fetchMapdataFixture(lat, lon, rad);
  while(nearby.len == null || nearby.len! == 0){
    rad = rad*2;
    nearby = await fetchMapdataFixture(lat, lon, rad);
  }
  // Log
  print("fetch nearby api response, data ${nearby.toJson()}");
  OperatorDB odb = new OperatorDB();
  // Cache this in provider perhaps
  List<String> operatorIdLst = [];
  StreamGroup<OperatorData> streams = new StreamGroup<OperatorData>();

  for(final data in nearby.data!){
    String latlon = data.lat!+"-"+data.lon!;
    List<Operator> operators = await odb.getOperatorsByLatLong(latlon);
    for(final oper in operators){
      print("found operator in vicinity with id! ${oper.operatorId!}");
      operatorIdLst.add(oper.operatorId!);
      // Maybe cache to special provider map
      Stream<OperatorData> opdata = await odb.getOperatorLiveLocationById(oper.operatorId!);
      streams.add(opdata);
    }
  }

  streams.close();
  return streams;
}
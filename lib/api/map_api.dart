import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mera_aadhar/models/nearby_api_model.dart';

const API_ENDPOINT = "http://65.2.3.246:8080/";

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
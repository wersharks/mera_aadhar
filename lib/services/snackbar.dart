import 'package:flutter/material.dart';
import 'package:mera_aadhar/utilities/constants.dart';

showSnackBar(String status, BuildContext context) {
  final snackBar = SnackBar(
      duration: Duration(milliseconds: 1250),
      content: Text(
        status,
        style: kSnackbarStyle,
      ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showSelectPhotoSnackBar(BuildContext context) {
  final snackBar = SnackBar(
    content: Text(
      'Please select a photo!',
      style: kSnackbarStyle,
    ),
    duration: Duration(milliseconds: 750),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

popNavigator(BuildContext context) {
  Navigator.pop(context);
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mera_aadhar/screens/home_page.dart';
import 'package:mera_aadhar/screens/operator_selection.dart';
import 'package:mera_aadhar/services/snackbar.dart';

import 'package:provider/provider.dart';

class Auth extends ChangeNotifier {
  AuthCredential? _phoneAuthCredential;
  User? _firebaseUser;
  String? _verificationId;
  int? _code;
  String mobileNumber = 'Unknown';
  String otp = '';
   String? mtoken = " ";
     bool isLoading = false;
void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      mtoken = token;
    });
  }

  addUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    bool exist = false;
    List fcmtokens = [];
    getToken();
    try {
      int flag = 0;
      await users.doc(user!.uid).get().then((doc) {
        exist = doc.exists;
        if (exist == true) {
          print('exist');

          try {
            var temp = doc.get('fcmtokens');
            fcmtokens = temp;
          } catch (e) {
            flag = 1;
            print("ELONMUSK");
            print(e.toString());
          }
          if (fcmtokens.isEmpty || flag == 1 || !fcmtokens.contains(mtoken)) {
            fcmtokens.add(mtoken!);
            users
                .doc(user.uid)
                .set({
                  'phoneNo': user.phoneNumber,
                  'fcmtokens': fcmtokens
                })
                .then((value) => print("User Added"))
                .catchError((error) => print("Failed to add user: $error"));
          }
        }
      });
    } catch (e) {
      // If any error
      exist = false;
      print(e);
    }
    if (exist == false) {
      fcmtokens.add(mtoken!);
      users
          .doc(user!.uid)
          .set({
            'phoneNo': user.phoneNumber,
            'fcmtokens': fcmtokens
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
  }

  Future<void> _login(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(this._phoneAuthCredential!)
          .then((UserCredential authRes) {
        _firebaseUser = authRes.user;
        print(_firebaseUser.toString());
        if (_firebaseUser != null) {
          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => OperatorSelectionScreen()));
          showSnackBar('Logged In!', context);
        }
      }).catchError((e) => showSnackBar(
              'The OTP entered is invalid. Kindly enter again.', context));
    } catch (e) {
      showSnackBar(e.toString(), context);
    }

    addUser();
    notifyListeners();
  }






    Future<void> submitPhoneNumber(BuildContext context) async {
    String phoneNumber = '+91$mobileNumber';
    print(phoneNumber);
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');
      // setState(() {
      //   _status += 'verificationCompleted\n';
      // });
      this._phoneAuthCredential = phoneAuthCredential;
      print(phoneAuthCredential);
    }

    void verificationFailed(FirebaseAuthException error) {
      print('verificationFailed');
      print(error);
      showSnackBar(
          'Verification failed! Either the entered number is wrong or there is some technical error. Please try again',
          context);
      Navigator.pop(context);
    }

    void codeSent(String verificationId, [int? code]) {
      print('codeSent');
      this._verificationId = verificationId;
      print(verificationId);
      this._code = code;
      print(code.toString());

      showSnackBar('OTP SENT!', context);
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
      // setState(() {
      //   _status += 'codeAutoRetrievalTimeout\n';
      // });
      print(verificationId);
    }

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  Future<void> submitOTP(BuildContext context) async {
    String smsCode = otp;

    this._phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: this._verificationId!, smsCode: smsCode);

    await _login(context);
  }


    Future<void> logout(BuildContext context) async {
    /// Method to Logout the `FirebaseUser` (`_firebaseUser`)
  
    try {
      // signout code
      await FirebaseAuth.instance.signOut();
   
      _firebaseUser = null;
      final snackBar = SnackBar(content: Text('Logged Out!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    
    } catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    // setName('Unknown');
    // setEmail('Unknown');
    // mobileNumber = 'Unknown';
  //  Provider.of<Account>(context, listen: false).logout();
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:mera_aadhar/provider/booking.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';

Map translatedStrings = {};
Map strings = {
  "aadharUpdationOrEnrollmentAtYourHome":
      "Aadhar updation or Enrollment at your home",
  "selectYourOwnTimeSlot&Operator": "Select your own Time Slot & Operator",
  // "b83ac7e5c93e97387c489386a49c7bbf": "b83ac7e5c93e97387c489386a49c7bbf",
  // "मेराAadhar": "मेरा Aadhar",
  // "surabhiMishra": "Surabhi Mishra",
  // "45": "4.5",
  // "niceOp": "nice op",
  // "goodOperator": "good operator",
  // "badOperator": "bad operator",
  // "averageOperatorGg": "average operator gg",
  // "bhb": "bhb",
   "bookOperator": "Book operator",
  // "operators": "Operators",
  // "morning": "morning",
  // "evening": "evening",
  // "pleaseSelectAnyOptionToContinue": "Please select any option to continue",
  // "selectDateAndTime": "Select Date and Time",
  // "morningSlots": "Morning Slots",
  // "eveningSlots": "Evening Slots",
 "keepWithYourself": "Keep With yourself",
  // "dart:ffi": "dart:ffi",
  "proofOfIdentity": "Proof of Identity",
  "proofOfAddress": "Proof of Address",
  "proofOfRelationship": "Proof of Relationship",
  // "dateOfBirth": "Date of Birth",
   "clickHereForMoreInformationAboutTheDocumentNeeded":
   "Click here for more information about the document needed.",
  "pleaseCheckAllTheDocumentsToContinue":
      "Please check all the documents to continue",
  // "myMap": "My Map",
  // "searchLocation": "Search Location",
  // "currentLocation": "Current Location",
  // "b116HostelCThaparUniversityPatiala":
  //     "B-116 Hostel C, Thapar University Patiala",
  // "lookUpTheMap": "Look up the map",
  // "finish": "Finish",
  // "yourDetailsHaveBeenCollected": "Your details have been collected",
  // "checkYourApplicationStatusUsingAppointmentId:":
  //     "Check your application status using appointment ID :",
  // "xxxxxxxxx": "XXX-XXX-XXX",
  // "giveFeedback": "Give Feedback",
  // "click": "CLICK",
  // "welcomePage": "Welcome Page",
  // "opfinishPage": "Op-Finish Page",
  // "opwelcomeScreen": "Op-welcome screen",
  // "opmap": "Op-map",
  // "welcomeSliders": "Welcome Sliders",
  // "documentCheckPage": "Document Check Page",
  // "mapIntroductionPage": "Map Introduction Page",
  // "editAddressPage": "Edit Address Page",
  // "clickMap": "CLICK MAP",
  // "logout": "Logout",
   "operatorBooked": "Operator Booked",
  // "finishPage": "finish page",
  // "modeSelectionPage": "Mode Selection Page",
  // "serviceSelectionPage": "Service Selection Page",
  // "testFirebase": "Test Firebase",
  // "datePage": "Date page",
  // "slotPage": "Slot page",
  // "operatorSelectionPage": "Operator selection page",
  // "bookOperatorPage": "book operator page",
  // "modeselectionpagedart": "modeSelectionPage.dart",
  // "serviceselectionpagedart": "serviceSelectionPage.dart",
  // "onboardingpagedart": "onBoardingPage.dart",
  // "loadingpagedart": "loadingPage.dart",
  // "documentcheckpagedart": "documentCheckPage.dart",
  // "mapintroductionpagedart": "MapIntroductionPage.dart",
  // "editaddresspagedart": "editAddressPage.dart",
  // "welcomepagedart": "welcomePage.dart",
  // "dart:async": "dart:async",
  // "pleaseSelectAnySlotToContinue": "Please select any slot to continue",
  // "selectaLanguage": "Select a language",
  "useHelpline": "Use Helpline",
  "selfUpdate": "Self Update",
  // "getting": "Getting...",
  // "addOrUpdateLocationMarker": "Add or update location marker",
  // "amHereForSure": "Am here for sure",
  // "notSure": "Not sure",
  // "dart:convert": "dart:convert",
  // "mobileNumber:9305895903": "Mobile Number: 9305895903",
  // "confirmLocation": "Confirm Location",
  // "editLocation": "Edit Location",
  // "awwSnapsLoadingData": "Aww snaps, loading data",
  // "home": "Home",
  // "thisIsaMapThatIsShowing": "This is a map that is showing",
  // "errorOccuredWhileAcquiringLocationErrorMessage:":
  //     "Error occured while acquiring location. Error Message :",
  // "inLiveUpdateModeOnlyZoomAndRotationAreEnable":
  //     "In live update mode only zoom and rotation are enable",
  // "tel:1947": "tel:1947",
  // "skip>>": "SKIP >>",
  // "aadharUpdationOrEnrollmentAtYourHome":
  //     "Aadhar updation or Enrollment at your home",
  // "selectYourOwnTimeSlot": "Select your own Time Slot",
   "reviewYourAppointments": "Review your appointments",
  // "getStarted": "Get Started",
  "yourOperator": "Your Operator",
  // "aadharUpdation": "Aadhar Updation",
  // "aadharEnrollment": "Aadhar Enrollment",
  // "confirmationOtp": "Confirmation OTP",
  "cancel": "Cancel",
  // "loadingData": "Loading data...",
  // "icon": "icon",
  // "iconhigh": "iconhigh",
  // "errorInMultistream": "Error in multistream",
  // "platformExceeeeeeeeeeption0": "Platform exceeeeeeeeeeption0",
  // "operatorSuccessfullyBooked": "Operator successfully booked!",
  // "widgetFinallyRebuild": "Widget finally rebuild",
  // "123456789": "123456789",
  // "streamClosed": "Stream closed!",
   "selectAnOperatorForYourself": "Select an operator for yourself",
  // "youAreAllDone": "You are all done!",
  // "completedBookingForId:": "Completed Booking for ID :",
  // "xxxxxxx92": "XXX-XXX-X92",
  // "nextBooking": "Next Booking",
  // "updation:Slot:1pm2pm": "Updation:          Slot:1pm-2pm",
  // "b169CHostelThaparUniversitypatialaPunjab":
  //     "B-169, C Hostel Thapar University,Patiala, Punjab",
  // "update": "update",
  // "senior": "senior",
  // "phydisabled": "phydisabled",
  // "new": "new",
  // "newApplication": "New Application",
  // "updateInformation": "Update Information",
  // "chooseIfYouAreaSeniorCitizenOrDifferentlyAbledOtherwiseGoAhead":
  //     "Choose if you are a senior citizen or differently abled, otherwise go ahead.",
  // "seniorCitizen": "Senior Citizen",
  // "differentlyAbled": "Differently Abled",
  // "didntGetOtp": "Didnt get OTP?",
  // "\\d{6}": "(\\d{6})",
  // "mobileVerification": "MOBILE VERIFICATION",
  // "verifyYourAccount": "VERIFY YOUR ACCOUNT",
 "login": "Login",
  // "enterOtp": "Enter OTP",
  // "pleaseEnterYourMobileNumber": "Please enter your mobile number.",
  // "enterTheOtpReceivedOnYourPhone": "Enter the OTP received on your phone.",
  // "[09]": "[0-9]",
  // "phoneNumber": "Phone Number",
  // "in": "IN",
  "resend": "Resend",
  // "requestOtp": "Request OTP",
  // "unknown": "Unknown",
  // "operatorLoggedIn": "Operator Logged In!",
  // "usernotfound": "user-not-found",
  // "noUserFoundForThatEmail": "No user found for that email.",
  // "wrongpassword": "wrong-password",
  // "wrongPasswordProvidedForThatUser": "Wrong password provided for that user.",
  // "operatorLoggedOut": "Operator Logged Out!",
  // "elonmusk": "ELONMUSK",
  // "userAdded": "User Added",
  // "users": "users",
  // "exist": "exist",
  // "fcmtokens": "fcmtokens",
  // "loggedIn": "Logged In!",
  // "theOtpEnteredIsInvalidKindlyEnterAgain":
  //     "The OTP entered is invalid. Kindly enter again.",
  // "verificationcompleted": "verificationCompleted",
  // "verificationcompleted\\n": "verificationCompleted\\n",
  // "verificationfailed": "verificationFailed",
  // "verificationFailedEitherTheEnteredNumberIsWrongOrThereIsSomeTechnicalErrorPleaseTryAgain":
  //     "Verification failed! Either the entered number is wrong or there is some technical error. Please try again",
  // "codesent": "codeSent",
  // "otpSent": "OTP SENT!",
  // "codeautoretrievaltimeout": "codeAutoRetrievalTimeout",
  // "codeautoretrievaltimeout\\n": "codeAutoRetrievalTimeout\\n",
  // "loggedOut": "Logged Out!",
  // "pleaseSelectaPhoto": "Please select a photo!",
  // "multistreamOperatorDataUpdate": "Multistream operator data update",
  // "yayBaby": "yay baby",
  // "30360001": "30.360001",
  // "76452232": "76.452232",
  // "addDummyBookingForPh8872276957": "Add dummy booking for ph 8872276957",
  // "initNwoDummy": "init nwo dummy",
  // "successfullyAddedBooking": "Successfully added booking!",
  // "getCurrentBookin": "Get current bookin",
  // "what": "What!",
  // "installSurabhiAsOperator": "install surabhi as operator",
  // "addedSurabhi": "Added surabhi",
  // "3166525645232554126": "31.66525645-23.2554126",
  // "lengthLst": "Length lst",
  // "getOperatorFromOperatorId": "get operator from operator id",
  // "abcdefgh": "abcdefgh",
  // "yeaSurab": "Yea surab!",
  // "getNearbyAadharCentersFromFastapi": "get nearby aadhar centers from fastapi",
  // "dummyUpdateOperatorLocDataRealtimeDatabase":
  //     "Dummy update operator loc data (realtime database)",
  // "subscribeOperatorLiveLocationStream":
  //     "Subscribe operator live location (stream)",
  // "loginOperatorProvider": "login operator provider",
  // "test1@testcom": "test1@test.com",
  // "logoutProvider": "logout provider",
  // "popupForaMarker": "Popup for a marker!",
  // "call": "Call",
  // "noReviewsYet": "No reviews yet",
  // "error": "Error",
  // "@@locale": "en",
  // "@@last_modified": "2022-08-25T18:16:18.534899"
};

Future<void> superTranslate(BuildContext context) async {
  final translator = GoogleTranslator();

  //final input = "Здравствуйте. Ты в порядке?";
  String? conv = Provider.of<BookingProvider>(context, listen: false)
          .languageToCode[
      Provider.of<BookingProvider>(context, listen: false).selectedLanguage];
  print(Provider.of<BookingProvider>(context, listen: false).selectedLanguage);
  // translator.translate(input, from: 'ru', to: 'en').then(print);
  print(conv);
  strings.forEach((key, value) async {
    await translator.translate(value, from: 'en', to: conv!).then((val) {
      translatedStrings[key] = val;
      print(val);
      print(key);
      print(translatedStrings[key]);
    });
  });

  // prints Hello. Are you okay?

  // var translation = await translator.translate("Dart is very cool!", to: 'pl');
  // print(translation);
  // // prints Dart jest bardzo fajny!

  // print(await "example".translate(to: 'pt'));
}

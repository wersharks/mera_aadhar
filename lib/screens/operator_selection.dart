import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mera_aadhar/firebase/booking_db.dart';
import 'package:mera_aadhar/models/booking_model.dart';
import 'package:mera_aadhar/provider/booking.dart';
import 'package:mera_aadhar/screens/operator_booked.dart';
import 'package:mera_aadhar/services/auth/otp_signin.dart';
import 'package:mera_aadhar/widgets/operator_book_card.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/services.dart';
import 'package:mera_aadhar/api/map_api.dart';

import 'package:mera_aadhar/screens/date_page.dart';

import 'package:mera_aadhar/services/snackbar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';
import 'package:location/location.dart';
import 'dart:typed_data';
import 'package:mapmyindia_place_widget/mapmyindia_place_widget.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:async/async.dart' show StreamGroup;
import 'package:mera_aadhar/models/operator_data_model.dart';
import 'package:mera_aadhar/firebase/operator_db.dart';
import 'package:tuple/tuple.dart';
import 'package:mera_aadhar/models/operator_model.dart';
import 'package:mera_aadhar/utilities/constants.dart';
import 'package:mera_aadhar/utilities/size_config.dart';
import 'dart:math' as math;

class OperatorSelectionScreen extends StatefulWidget {
  const OperatorSelectionScreen({Key? key}) : super(key: key);

  @override
  State<OperatorSelectionScreen> createState() =>
      _OperatorSelectionScreenState();
}

class _OperatorSelectionScreenState extends State<OperatorSelectionScreen> {
  late MapmyIndiaMapController _mapController;
  LatLng pinLocation = LatLng(25.321684, 82.987289);
  Symbol? location_pin = null;
  var operatorMapPins = new Map();
  var symbolIdToOperatorId = new Map();
  String _locationText = "Loading data...";
  Map<String, Operator> idToOperator = {};
  Symbol? lastClicked;
  PanelController panelController = PanelController();
  final _chars = '123456789';
  Random _rnd = Random();

  String generatePin(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  void initState() {
    super.initState();
    // initLocationService();
    // openMapmyIndiaPlacePickerWidget();
  }

  SymbolOptions createNormalSymbol(LatLng latLng) {
    return SymbolOptions(
        draggable: true, iconImage: "opgreen", iconSize: 0.5, geometry: latLng);
  }

  SymbolOptions createRedSymbol(LatLng latLng) {
    return SymbolOptions(
        draggable: true, iconImage: "opred", iconSize: 0.5, geometry: latLng);
  }

  SymbolOptions createHighlightSymbol(LatLng latLng) {
    return SymbolOptions(
        draggable: true,
        iconImage: "opgreenselec",
        iconSize: 0.75,
        geometry: latLng);
  }

  void addOrUpdateLocationMarker(LatLng latlng) async {
    print("Add or update location marker");
    if (location_pin == null) {
      location_pin = await _mapController.addSymbol(
          SymbolOptions(draggable: true, iconSize: 1.5, geometry: latlng));
    } else {
      _mapController.updateSymbol(location_pin!,
          SymbolOptions(draggable: true, iconSize: 1.5, geometry: latlng));
    }

    await _mapController.easeCamera(CameraUpdate.newLatLngZoom(latlng, 14));
  }

  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return _mapController.addImage(name, list);
  }

  List<Operator> getActiveOperators() {
    List<Operator> act = [];
    for (var v in symbolIdToOperatorId.values) {
      Operator op = idToOperator[v]!;
      act.add(op);
    }
    return act;
  }

  void addOrUpdateOperatorLocation(OperatorData odata) async {
    LatLng latlng = LatLng(odata.loc!.lat!, odata.loc!.lon!);
    print("Show op ${odata.operatorId!} with latlon ${latlng.toJson()}");
    Operator operator = idToOperator[odata.operatorId!]!;

    SymbolOptions symops;
    if (operator.isOpFree) {
      symops = createNormalSymbol(latlng);
    } else {
      symops = createRedSymbol(latlng);
    }

    if (operatorMapPins.containsKey(odata.operatorId!)) {
      // Update marker
      Symbol sym = operatorMapPins[odata.operatorId!];
      _mapController.updateSymbol(sym, symops);
    } else {
      Symbol sym = await _mapController.addSymbol(symops);
      operatorMapPins[odata.operatorId!] = sym;
      symbolIdToOperatorId[sym.id] = odata.operatorId!;
    }
  }

  void registerDeregisterOperators(DateTime date, String time) async {
    String lat = pinLocation.latitude.toString();
    String lon = pinLocation.longitude.toString();
    Tuple2<Map<String, Operator>, StreamGroup<OperatorData>> rdata =
        await getAllOperatorsByMyLatLong(lat, lon, date, time);
    StreamGroup<OperatorData> streamgroup = rdata.item2;
    idToOperator = rdata.item1;

    StreamSubscription<OperatorData> subscriber =
        streamgroup.stream.listen((OperatorData data) {
      addOrUpdateOperatorLocation(data);
      print("received data: ${data.toJson()}");
    }, onError: (error) {
      print("Error in multistream");
      print(error);
    }, onDone: () {
      print('Stream closed!');
    });
  }

  openMapmyIndiaPlacePickerWidget(BuildContext context) async {
    ReverseGeocodePlace place;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      place = await openPlacePicker(PickerOption());
    } on PlatformException {
      print("Platform exceeeeeeeeeeption0");
      place = ReverseGeocodePlace();
    }
    print(place.toJson());

    if (place.lat == null || place.lng == null) {
      // If APIs Consumed
      String regexString = r'\[(\d+.\d+), (\d+.\d+)\]';
      RegExp regExp = new RegExp(regexString);
      var matches = regExp.allMatches(place.formattedAddress!);
      var match = matches.elementAt(0);
      pinLocation =
          LatLng(double.parse(match.group(1)!), double.parse(match.group(2)!));
      _locationText = (await getAddressByLatLonNomin(
          pinLocation.latitude, pinLocation.longitude))!;
    } else {
      _locationText = place.formattedAddress!;
      pinLocation = LatLng(double.parse(place.lat!), double.parse(place.lng!));
    }

    // setState(() {
    // _locationText = match.group(0)!;
    _mapController.easeCamera(CameraUpdate.newLatLngZoom(pinLocation, 14));
    addOrUpdateLocationMarker(pinLocation);

    // });

    // Change to time and slot
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => DatePage()));

    DateTime? date =
        Provider.of<BookingProvider>(context, listen: false).booking.date;
    String? time =
        Provider.of<BookingProvider>(context, listen: false).booking.slotTime;

    while (date == null || time == null) {
      showSnackBar("Please select a valid date and time!!", context);
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => DatePage()));
      date = Provider.of<BookingProvider>(context, listen: false).booking.date;
      time =
          Provider.of<BookingProvider>(context, listen: false).booking.slotTime;
    }
    registerDeregisterOperators(date, time);
  }

  void utilHighlightOperator(Symbol symbol, bool highlight) async {
    SymbolOptions change;
    if (highlight) {
      change = createHighlightSymbol(symbol.options.geometry!);
    } else {
      change = createNormalSymbol(symbol.options.geometry!);
    }
    await _mapController.updateSymbol(symbol, change);
  }

  void symbolCallback(BuildContext context, Symbol symbol) async {
    if (symbol == location_pin) return;
    Operator opclick = idToOperator[symbolIdToOperatorId[symbol.id]]!;
    if (opclick.isOpFree == false) return;
    // if last called not null then dehilight symbol
    if (lastClicked != null) {
      utilHighlightOperator(lastClicked!, false);
      if (lastClicked! == symbol) {
        Provider.of<BookingProvider>(context, listen: false).removeFocus();
        lastClicked = null;
        return;
      }
    }
    utilHighlightOperator(symbol, true);

    Provider.of<BookingProvider>(context, listen: false).setOperator(opclick);
    panelController.open();
    setState(() {});
    print(
        "Clicked op id ${symbolIdToOperatorId[symbol.id]} with name ${opclick.name}");

    lastClicked = symbol;
  }

  void bookOperatorButton(BuildContext context) async {
    // Finally book this operator for this booking!
    // Main part! First collect all the data:
    int randomNumber = int.parse(generatePin(8));

    Booking bookin =
        Provider.of<BookingProvider>(context, listen: false).booking;
    Operator oper =
        Provider.of<BookingProvider>(context, listen: false).focusOperator;
    String phno = FirebaseAuth.instance.currentUser!.phoneNumber!;

    bookin.bookingId = randomNumber;
    bookin.operatorId = oper.operatorId!;
    bookin.phoneNo = phno;
    bookin.bookingLocation = new BookingLocation(
        lat: location_pin!.options.geometry!.latitude,
        lon: location_pin!.options.geometry!.longitude);
    bookin.userdata = new Userdata(
        phoneNo: phno,
        locationText: _locationText,
        type: bookin.userdata!.type);
    bookin.confirmOtp = generatePin(4);
    bookin.timestamp = DateTime.now().millisecondsSinceEpoch;

    print(bookin.toJson());

    BookingDB bdb = new BookingDB();
    bdb.addNewBooking(bookin).then((value) {
      showSnackBar("Operator successfully booked!", context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OperatorBooked()));
    });
    // Navigator.push(context, MaterialPageRoute(builder: (context) => OperatorBooked()));
  }

  @override
  Widget build(BuildContext context) {
    print("Widget finally rebuild");
    print(pinLocation);
    return Scaffold(
      backgroundColor: Color(0xFFFF4B3A),
      body: Consumer<BookingProvider>(builder: (context, provider, child) {
        return SlidingUpPanel(
          controller: panelController,
          defaultPanelState:
              (provider.isOpSelected) ? PanelState.OPEN : PanelState.CLOSED,
          maxHeight: 370,
          minHeight: 150,
          backdropEnabled: true,
          color: Colors.transparent,
          panel: Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: (!provider.isOpSelected)
                  ? Column(
                      children: [
                        const Icon(
                          Icons.arrow_drop_up_outlined,
                          size: 40,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.house,
                            color: Colors.black,
                            size: 36,
                          ),
                          title: Text(
                            _locationText,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                          subtitle: Text(
                            'Mobile Number: ${Provider.of<BookingProvider>(context, listen: false).booking.userdata!.phoneNo}',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB2B2B2),
                                fontSize: 16),
                          ),
                          trailing: IconButton(
                            icon: new Icon(Icons.edit),
                            highlightColor: Colors.pink,
                            onPressed: () {
                              openMapmyIndiaPlacePickerWidget(context);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 70,
                          width: 315,
                          decoration: BoxDecoration(
                              color: Color(0xFFF8774A),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              'Select an operator for yourself',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        const Icon(
                          Icons.arrow_drop_up_outlined,
                          size: 40,
                        ),
                        SizedBox(
                          height: 240,
                          child: PageView.builder(
                            onPageChanged: (val) {
                              Provider.of<BookingProvider>(context,
                                      listen: false)
                                  .setOperator(getActiveOperators()[val]);
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: getActiveOperators().length,
                            itemBuilder: (context, int i) {
                              return OperatorBookCard(
                                name: getActiveOperators()[i].name.toString(),
                                rating:
                                    getActiveOperators()[i].ratings.toString(),
                                reviews: Map.fromIterable(
                                    getActiveOperators()[i].reviews!,
                                    key: (v) => v[0],
                                    value: (v) => v),
                                image:
                                    "operator/${getActiveOperators()[i].operatorId.toString()}.jpg",
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          style: buttonStyle,
                          onPressed: () {
                            bookOperatorButton(context);
                          },
                          child: Container(
                            height: 50,
                            width: 315,
                            decoration: BoxDecoration(
                                // color: Color(0xFFF8774A),
                                borderRadius: BorderRadius.circular(30)),
                            child: const Center(
                              child: Text(
                                'Book operator',
                                style: buttonTextStyle,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
          body: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor: Color(0xFFF4F4F4),
                  radius: 40,
                  child: Image.asset(
                    'assets/aadharlogo.png',
                    width: 55,
                    height: 55,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Expanded(
                      child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 600,
                      child: MapmyIndiaMap(
                        initialCameraPosition: CameraPosition(
                          target: pinLocation,
                          zoom: 14.0,
                        ),
                        onMapCreated: (map) async {
                          _mapController = map;
                          _mapController.onSymbolTapped.add((Symbol symbol) {
                            symbolCallback(context, symbol);
                            //   setState(() {});
                          });
                        },
                        onStyleLoadedCallback: () {
                          addImageFromAsset(
                              "opgreen", "assets/op_lightgreen.png");
                          addImageFromAsset(
                              "opgreenselec", "assets/op_darkgreen.png");
                          addImageFromAsset("opred", "assets/op_red.png");

                          addImageFromAsset(
                              "icon", "assets/operator_pin_icon.png");
                          addImageFromAsset(
                              "iconhigh", "assets/icon_op_yellow.png");
                          openMapmyIndiaPlacePickerWidget(context);
                        },
                      ),
                    ),
                  )),
                  GestureDetector(
                    onTap: () {
                      openMapmyIndiaPlacePickerWidget(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: SizedBox(
                            width: 140,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Edit Location',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

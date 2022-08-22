import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mera_aadhar/provider/booking.dart';
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
  bool isOpSelected = false;
  String _locationText = "Loading data...";

  @override
  void initState() {
    super.initState();
    // initLocationService();
    // openMapmyIndiaPlacePickerWidget();
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

  void addOrUpdateOperatorLocation(OperatorData odata) async {
    print("here");
    LatLng latlng = LatLng(odata.loc!.lat!, odata.loc!.lon!);
    print("Show op ${odata.operatorId!} with latlon ${latlng.toJson()}");
    SymbolOptions symops = SymbolOptions(
        draggable: true, iconImage: "icon", iconSize: 0.5, geometry: latlng);

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

  void registerDeregisterOperators() async {
    String lat = pinLocation.latitude.toString();
    String lon = pinLocation.longitude.toString();
    StreamGroup<OperatorData> streamgroup =
        await getAllOperatorsByMyLatLong(lat, lon);

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

  openMapmyIndiaPlacePickerWidget() async {
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
      _locationText = (await getAddressByLatLon(
          pinLocation.latitude, pinLocation.longitude))!;
    } else {
      _locationText = place.formattedAddress!;
      pinLocation = LatLng(double.parse(place.lat!), double.parse(place.lng!));
    }

    setState(() {
      // _locationText = match.group(0)!;
      _mapController.easeCamera(CameraUpdate.newLatLngZoom(pinLocation, 14));
      addOrUpdateLocationMarker(pinLocation);
      registerDeregisterOperators();
    });

    // Change to time and slot
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DatePage()));
  }

  void symbolCallback(BuildContext context, Symbol symbol) async {
    // Add callback
    Provider.of<BookingProvider>(context, listen: false).operator =
        (await OperatorDB().getOperatorById(symbolIdToOperatorId[symbol.id]))!;
    isOpSelected = true;
    print(symbolIdToOperatorId[symbol.id]);
  }

  @override
  Widget build(BuildContext context) {
    print("Widget finally rebuild");
    print(pinLocation);
    return Scaffold(
      backgroundColor: Color(0xFFFF4B3A),
      body: SlidingUpPanel(
        maxHeight: 360,
        minHeight: 150,
        backdropEnabled: true,
        color: Colors.transparent,
        panel: Container(
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: (!isOpSelected)
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
                          openMapmyIndiaPlacePickerWidget();
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
                    OperatorBookCard(
                      name: Provider.of<BookingProvider>(context, listen: false)
                          .operator
                          .name!,
                      rating:
                          Provider.of<BookingProvider>(context, listen: false)
                              .operator
                              .ratings!,
                      reviews: Map.fromIterable(
                          Provider.of<BookingProvider>(context, listen: false)
                              .operator
                              .reviews!,
                          key: (v) => v[0],
                          value: (v) => v),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 70,
                      width: 315,
                      decoration: BoxDecoration(
                          color: Color(0xFFF8774A),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'Book operator',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
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
                  width: 35,
                  height: 35,
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
                          setState(() {});
                        });
                      },
                      onStyleLoadedCallback: () {
                        addImageFromAsset(
                            "icon", "assets/operator_pin_icon.png");
                        openMapmyIndiaPlacePickerWidget();
                      },
                    ),
                  ),
                )),
                GestureDetector(
                  onTap: () {
                    openMapmyIndiaPlacePickerWidget();
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
      ),
    );
  }
}

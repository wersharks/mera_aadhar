// ignore_for_file: prefer_const_constructors

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:mera_aadhar/services/snackbar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';
import 'package:location/location.dart';
import 'dart:typed_data';
import 'package:mapmyindia_place_widget/mapmyindia_place_widget.dart';
import 'dart:convert';

class MapIntroductionPage extends StatefulWidget {
  const MapIntroductionPage({Key? key}) : super(key: key);

  @override
  State<MapIntroductionPage> createState() => _MapIntroductionPageState();
}

class _MapIntroductionPageState extends State<MapIntroductionPage> {
  late MapmyIndiaMapController _mapController;
  String? _serviceError = '';
  final Location _locationService = Location();
  bool _liveUpdate = false;
  bool _permission = false;
  LocationData? _currentLocation;
  String? address = "Getting...";
  // Symbol _mylocation = SymbolOptions(geometry: LatLng(25.321684, 82.987289));
  Symbol? location_pin = null;
  ReverseGeocodePlace? _place = null;

  @override
  void initState() {
    super.initState();
    initLocationService();
    // openMapmyIndiaPlacePickerWidget();
  }

  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return _mapController.addImage(name, list);
  }

  void initLocationService() async {
    LocationData? location;
    bool serviceEnabled;
    bool serviceRequestResult;

    try {
      serviceEnabled = await _locationService.serviceEnabled();

      if (serviceEnabled) {
        final permission = await _locationService.requestPermission();
        _permission = permission == PermissionStatus.granted;

        await _locationService.changeSettings(
          accuracy: LocationAccuracy.high,
          interval: 1000,
        );

        if (_permission) {
          location = await _locationService.getLocation();
          _currentLocation = location;
          print(_currentLocation);
          // Symbol symbol = await _mapController.addSymbol(SymbolOptions(geometry: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!)));

        }
      } else {
        serviceRequestResult = await _locationService.requestService();
        if (serviceRequestResult) {
          initLocationService();
          return;
        }
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      if (e.code == 'PERMISSION_DENIED') {
        _serviceError = e.message;
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
        _serviceError = e.message;
      }
      location = null;
    }
  }

  void addOrUpdateLocationMarker(LatLng latlng) async {
    print("Add or update location marker");
    if (location_pin == null) {
      location_pin = await _mapController.addSymbol(
          SymbolOptions(draggable: true, iconSize: 1, geometry: latlng));
    } else {
      _mapController.updateSymbol(location_pin!,
          SymbolOptions(draggable: true, iconSize: 1, geometry: latlng));
    }

    await _mapController.easeCamera(CameraUpdate.newLatLngZoom(latlng, 14));
  }
    void addLocationMarker() async {
      Symbol symbol = await _mapController.addSymbol(SymbolOptions(
          draggable: true,
          iconSize: 3,
          geometry: LatLng(
              _currentLocation!.latitude!, _currentLocation!.longitude!)));
    }

    reverseGeocode(LatLng latlng) async {
      try {
        ReverseGeocodeResponse? result =
            await MapmyIndiaReverseGeocode(location: latlng)
                .callReverseGeocode();
        if (result != null &&
            result.results != null &&
            result.results!.length > 0) {
          address = result.results![0].formattedAddress!;
        }
        print(result);
      } catch (e) {
        if (e is PlatformException) {
          showSnackBar('${e.code} --- ${e.message}', context);
        }
      }
    }

    openMapmyIndiaPlacePickerWidget() async {
      ReverseGeocodePlace place;
      // Platform messages may fail, so we use a try/catch PlatformException.
      try {
        place = await openPlacePicker(PickerOption());
      } on PlatformException {
        place = ReverseGeocodePlace();
      }
      print(json.encode(place.toJson()));
      addOrUpdateLocationMarker(
          LatLng(double.parse(place.lat!), double.parse(place.lng!)));
      // If the widget was removed from the tree while the asynchronous platform
      // message was in flight, we want to discard the reply rather than calling
      //LatLng(25.321684, 82.987289) setState to update our non-existent appearance.
      if (!mounted) return;

      setState(() {
        _place = place;
      });
    }

    void addMarker() async {
      // addOrUpdateLocationMarker(LatLng(25.321684, 82.987289));
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xFFFF4B3A),
        body: SlidingUpPanel(
          maxHeight: 280,
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
            child: Column(
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
                    address!,
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  subtitle: Text(
                    'Mobile Number: 9305895903',
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
                      'Confirm Location',
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
                            target: LatLng(25.321684, 82.987289),
                            zoom: 14.0,
                          ),
                          myLocationEnabled: true,
                          // myLocationTrackingMode: MyLocationTrackingMode.Tracking,

                          onUserLocationUpdated: (location) async {
                            print(
                                "Position: ${location.position.toString()}, Speed: ${location.speed}, Altitude: ${location.altitude}");
                            addOrUpdateLocationMarker(location.position);
                          },
                          onMapCreated: (map) async {
                            _mapController = map;
                          },
                          onStyleLoadedCallback: () {
                            addMarker();
                          }
                          // print("Am here for sure");
                          // _mapController.requestMyLocationLatLng().then((val){
                          //   print("Not sure");
                          //   addOrUpdateLocationMarker(val);
                          // });

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
                          child: Text(
                            'Edit Location',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
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


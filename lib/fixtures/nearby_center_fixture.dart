import 'package:mera_aadhar/models/nearby_api_model.dart';
import 'dart:convert';

class NearbyApiFixture {
    static NearbyApiResponse dummyNearbyApi(){
        Map<String, dynamic> data = jsonDecode('{"code":1,"data":[{"uid":"605670","lat":"30.360078811645508","lon":"76.45403289794922","centerName":"UNIVERISTY POST OFFICE (147002)","location":"UNIVERISTY CAMPUS , Patiala, Patiala, Patiala, Punjab."},{"uid":"590927","lat":"30.35227394104004","lon":"76.4378433227539","centerName":"BSNL EXCHANGE (147002)","location":"URBAN ESTATE,PHASE 2, PATIALA, Falauli, Patiala, Patiala, Punjab."},{"uid":"587255","lat":"30.368160247802734","lon":"76.47557830810547","centerName":"punjab national bank` (147021)","location":"punjab national bank,opposite Chaman hospital,p.o bahadurgarh,patiala,punjab, Bir Bahadurgarh, Patiala, Patiala, Punjab."},{"uid":"639997","lat":"30.333850860595703","lon":"76.43820190429688","centerName":" CHAURA (147002)","location":"VILL CHAURA DISTT PATIALA, Chaura, Patiala, Patiala, Punjab."},{"uid":"587299","lat":"30.361413955688477","lon":"76.4029541015625","centerName":"JHILL (147001)","location":"PUNJAB AND SIND BANK JHILL PATIALA, Patiala, Patiala, Patiala, Punjab."},{"uid":"587298","lat":"30.364282608032227","lon":"76.4030532836914","centerName":"CBIN0280321 (147001)","location":"near amar banquat sirhind road patiala, Patiala, Patiala, Patiala, Punjab."},{"uid":"605689","lat":"30.353519439697266","lon":"76.40147399902344","centerName":"GPP PO (147004)","location":"Grain Market, Sirhind Road, Patiala, Patiala, Patiala, Patiala, Punjab."}],"len":7}');
        final NearbyApiResponse neaby = NearbyApiResponse.fromJson(data);
        return neaby;
    }

    Future<NearbyApiResponse?> fixture_nearbyapiresponse_getData() async {
        return dummyNearbyApi();
    }
}

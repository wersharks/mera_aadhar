class NearbyApiResponse {
  int? code;
  List<Data>? data;
  int? len;

  NearbyApiResponse({this.code, this.data, this.len});

  NearbyApiResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    len = json['len'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['len'] = this.len;
    return data;
  }
}

class Data {
  String? uid;
  String? lat;
  String? lon;
  String? centerName;
  String? location;

  Data({this.uid, this.lat, this.lon, this.centerName, this.location});

  Data.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    lat = json['lat'];
    lon = json['lon'];
    centerName = json['centerName'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['centerName'] = this.centerName;
    data['location'] = this.location;
    return data;
  }
}

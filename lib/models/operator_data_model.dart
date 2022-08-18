class OperatorData {
  String? operatorId;
  Loc? loc;
  int? nextServingId;
  int? timestamp;

  OperatorData({this.operatorId, this.loc, this.nextServingId, this.timestamp});

  OperatorData.fromJson(Map<String, dynamic> json) {
    operatorId = json['operatorId'];
    loc = json['loc'] != null ? new Loc.fromJson(json['loc']) : null;
    nextServingId = json['nextServingId'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['operatorId'] = this.operatorId;
    if (this.loc != null) {
      data['loc'] = this.loc!.toJson();
    }
    data['nextServingId'] = this.nextServingId;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Loc {
  double? lat;
  double? lon;

  Loc({this.lat, this.lon});

  Loc.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}

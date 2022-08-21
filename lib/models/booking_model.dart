class Booking {
  int? bookingId;
  String? operatorId;
  int? bookingType;
  String? phoneNo;
  BookingLocation? bookingLocation;
  Userdata? userdata;
  int? confirmOtp;
  Paydata? paydata;
  String? bookingStatus;
  String? slotTime;
  String? slotDate;
  int? timestamp;

  Booking(
      {this.bookingId,
      this.operatorId,
      this.bookingType,
      this.phoneNo,
      this.bookingLocation,
      this.userdata,
      this.confirmOtp,
      this.paydata,
      this.bookingStatus,
      this.slotTime,
      this.slotDate,
      this.timestamp});

  Booking.fromJson(Map<String, dynamic> json) {
    bookingId = json['bookingId'];
    operatorId = json['operatorId'];
    bookingType = json['bookingType'];
    phoneNo = json['phoneNo'];
    bookingLocation = json['bookingLocation'] != null
        ? new BookingLocation.fromJson(json['bookingLocation'])
        : null;
    userdata = json['userdata'] != null
        ? new Userdata.fromJson(json['userdata'])
        : null;
    confirmOtp = json['confirmOtp'];
    paydata =
        json['paydata'] != null ? new Paydata.fromJson(json['paydata']) : null;
    bookingStatus = json['bookingStatus'];
    slotTime = json['slotTime'];
    slotDate = json['slotDate'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingId'] = this.bookingId;
    data['operatorId'] = this.operatorId;
    data['bookingType'] = this.bookingType;
    data['phoneNo'] = this.phoneNo;
    if (this.bookingLocation != null) {
      data['bookingLocation'] = this.bookingLocation!.toJson();
    }
    if (this.userdata != null) {
      data['userdata'] = this.userdata!.toJson();
    }
    data['confirmOtp'] = this.confirmOtp;
    if (this.paydata != null) {
      data['paydata'] = this.paydata!.toJson();
    }
    data['bookingStatus'] = this.bookingStatus;
    data['slotTime'] = this.slotTime;
    data['slotDate'] = this.slotDate;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class BookingLocation {
  double? lat;
  double? lon;

  BookingLocation({this.lat, this.lon});

  BookingLocation.fromJson(Map<String, dynamic> json) {
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

class Userdata {
  String? phoneNo;
  int? type;
  String? locationText;

  Userdata({this.phoneNo, this.type, this.locationText});

  Userdata.fromJson(Map<String, dynamic> json) {
    phoneNo = json['phoneNo'];
    type = json['type'];
    locationText = json['locationText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNo'] = this.phoneNo;
    data['type'] = this.type;
    data['locationText'] = this.locationText;
    return data;
  }
}

class Paydata {
  String? type;
  Null? receipt;
  String? status;

  Paydata({this.type, this.receipt, this.status});

  Paydata.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    receipt = json['receipt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['receipt'] = this.receipt;
    data['status'] = this.status;
    return data;
  }
}

class Operator {
  String? operatorId;
  String? centerLocation;
  String? centerUid;
  String? name;
  String? picture;
  int? age;
  String? gender;
  String? phoneNo;
  String? email;
  String? ratings;
  List<String>? reviews;
  bool? isOperatorActive;
  int? timestamp;

  Operator(
      {this.operatorId,
      this.centerLocation,
      this.centerUid,
      this.name,
      this.picture,
      this.age,
      this.gender,
      this.phoneNo,
      this.email,
      this.ratings,
      this.reviews,
      this.isOperatorActive,
      this.timestamp});

  Operator.fromJson(Map<String, dynamic> json) {
    operatorId = json['operatorId'];
    centerLocation = json['centerLocation'];
    centerUid = json['centerUid'];
    name = json['name'];
    picture = json['picture'];
    age = json['age'];
    gender = json['gender'];
    phoneNo = json['phoneNo'];
    email = json['email'];
    ratings = json['ratings'];
    reviews = json['reviews'].cast<String>();
    isOperatorActive = json['isOperatorActive'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['operatorId'] = this.operatorId;
    data['centerLocation'] = this.centerLocation;
    data['centerUid'] = this.centerUid;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['phoneNo'] = this.phoneNo;
    data['email'] = this.email;
    data['ratings'] = this.ratings;
    data['reviews'] = this.reviews;
    data['isOperatorActive'] = this.isOperatorActive;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

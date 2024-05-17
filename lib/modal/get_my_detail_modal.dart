class GetMyDetailsModal {
  User? user;
  List<AllRequest>? allRequest;

  GetMyDetailsModal({this.user, this.allRequest});

  GetMyDetailsModal.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['allRequest'] != null) {
      allRequest = <AllRequest>[];
      json['allRequest'].forEach((v) {
        allRequest!.add(new AllRequest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.allRequest != null) {
      data['allRequest'] = this.allRequest!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? userId;
  String? employeeCode;
  String? role;
  String? password;
  int? enabled;
  String? fullname;
  String? contactNo;
  String? status;
  Null? profile;
  Null? idCard;
  Null? idCardBack;
  int? designation;
  int? department;
  Null? departmentalPost;
  Null? institutePost;
  Null? email;
  String? registeredOn;
  String? otp;
  String? otpTime;
  Null? issuedCycle;
  Null? point;

  User(
      {this.userId,
      this.employeeCode,
      this.role,
      this.password,
      this.enabled,
      this.fullname,
      this.contactNo,
      this.status,
      this.profile,
      this.idCard,
      this.idCardBack,
      this.designation,
      this.department,
      this.departmentalPost,
      this.institutePost,
      this.email,
      this.registeredOn,
      this.otp,
      this.otpTime,
      this.issuedCycle,
      this.point});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    employeeCode = json['employeeCode'];
    role = json['role'];
    password = json['password'];
    enabled = json['enabled'];
    fullname = json['fullname'];
    contactNo = json['contactNo'];
    status = json['status'];
    profile = json['profile'];
    idCard = json['idCard'];
    idCardBack = json['idCardBack'];
    designation = json['designation'];
    department = json['department'];
    departmentalPost = json['departmentalPost'];
    institutePost = json['institutePost'];
    email = json['email'];
    registeredOn = json['registeredOn'];
    otp = json['otp'];
    otpTime = json['otpTime'];
    issuedCycle = json['issuedCycle'];
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['employeeCode'] = this.employeeCode;
    data['role'] = this.role;
    data['password'] = this.password;
    data['enabled'] = this.enabled;
    data['fullname'] = this.fullname;
    data['contactNo'] = this.contactNo;
    data['status'] = this.status;
    data['profile'] = this.profile;
    data['idCard'] = this.idCard;
    data['idCardBack'] = this.idCardBack;
    data['designation'] = this.designation;
    data['department'] = this.department;
    data['departmentalPost'] = this.departmentalPost;
    data['institutePost'] = this.institutePost;
    data['email'] = this.email;
    data['registeredOn'] = this.registeredOn;
    data['otp'] = this.otp;
    data['otpTime'] = this.otpTime;
    data['issuedCycle'] = this.issuedCycle;
    data['point'] = this.point;
    return data;
  }
}

class AllRequest {
  int? id;
  String? requestedOn;
  Null? issuedOn;
  Null? surrenderOn;
  String? status;
  User? requestedBy;
  RequestedFor? requestedFor;
  Null? issuedBy;
  Null? revokedBy;
  Null? revokedPoint;
  AtPoint? issuedPoint;

  AllRequest(
      {this.id,
      this.requestedOn,
      this.issuedOn,
      this.surrenderOn,
      this.status,
      this.requestedBy,
      this.requestedFor,
      this.issuedBy,
      this.revokedBy,
      this.revokedPoint,
      this.issuedPoint});

  AllRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    requestedOn = json['requestedOn'];
    issuedOn = json['issuedOn'];
    surrenderOn = json['surrenderOn'];
    status = json['status'];
    requestedBy = json['requestedBy'] != null ? new User.fromJson(json['requestedBy']) : null;
    requestedFor =
        json['requestedFor'] != null ? new RequestedFor.fromJson(json['requestedFor']) : null;
    issuedBy = json['issuedBy'];
    revokedBy = json['revokedBy'];
    revokedPoint = json['revokedPoint'];
    issuedPoint = json['issuedPoint'] != null ? new AtPoint.fromJson(json['issuedPoint']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['requestedOn'] = this.requestedOn;
    data['issuedOn'] = this.issuedOn;
    data['surrenderOn'] = this.surrenderOn;
    data['status'] = this.status;
    if (this.requestedBy != null) {
      data['requestedBy'] = this.requestedBy!.toJson();
    }
    if (this.requestedFor != null) {
      data['requestedFor'] = this.requestedFor!.toJson();
    }
    data['issuedBy'] = this.issuedBy;
    data['revokedBy'] = this.revokedBy;
    data['revokedPoint'] = this.revokedPoint;
    if (this.issuedPoint != null) {
      data['issuedPoint'] = this.issuedPoint!.toJson();
    }
    return data;
  }
}

class RequestedFor {
  int? id;
  String? name;
  String? category;
  String? inStockDate;
  String? status;
  String? image1;
  String? image2;
  AtPoint? atPoint;
  bool? available;
  Null? image1Source;
  Null? image2Source;

  RequestedFor(
      {this.id,
      this.name,
      this.category,
      this.inStockDate,
      this.status,
      this.image1,
      this.image2,
      this.atPoint,
      this.available,
      this.image1Source,
      this.image2Source});

  RequestedFor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    inStockDate = json['inStockDate'];
    status = json['status'];
    image1 = json['image1'];
    image2 = json['image2'];
    atPoint = json['atPoint'] != null ? new AtPoint.fromJson(json['atPoint']) : null;
    available = json['available'];
    image1Source = json['image1Source'];
    image2Source = json['image2Source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['inStockDate'] = this.inStockDate;
    data['status'] = this.status;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    if (this.atPoint != null) {
      data['atPoint'] = this.atPoint!.toJson();
    }
    data['available'] = this.available;
    data['image1Source'] = this.image1Source;
    data['image2Source'] = this.image2Source;
    return data;
  }
}

class AtPoint {
  int? id;
  String? name;
  double? longitude;
  double? latitude;

  AtPoint({this.id, this.name, this.longitude, this.latitude});

  AtPoint.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}

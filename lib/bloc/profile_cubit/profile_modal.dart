import '../get_issue_req/get_issue_req_modal.dart';

class User {
  int? userId;
  String? employeeCode;
  String? role;
  String? password;
  int? enabled;
  String? fullname;
  String? contactNo;
  String? status;
  dynamic? profile;
  dynamic? idCard;
  dynamic? idCardBack;
  int? designation;
  int? department;
  dynamic? departmentalPost;
  dynamic? institutePost;
  dynamic? email;
  String? registeredOn;
  dynamic? otp;
  dynamic? otpTime;
  IssuedCycle? issuedCycle;
  dynamic? point;

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
    issuedCycle = json['issuedCycle'] != null ? IssuedCycle.fromJson(json['issuedCycle']) : null;
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['employeeCode'] = employeeCode;
    data['role'] = role;
    data['password'] = password;
    data['enabled'] = enabled;
    data['fullname'] = fullname;
    data['contactNo'] = contactNo;
    data['status'] = status;
    data['profile'] = profile;
    data['idCard'] = idCard;
    data['idCardBack'] = idCardBack;
    data['designation'] = designation;
    data['department'] = department;
    data['departmentalPost'] = departmentalPost;
    data['institutePost'] = institutePost;
    data['email'] = email;
    data['registeredOn'] = registeredOn;
    data['otp'] = otp;
    data['otpTime'] = otpTime;
    if (issuedCycle != null) {
      data['issuedCycle'] = issuedCycle!.toJson();
    }
    data['point'] = point;
    return data;
  }
}

class IssuedCycle {
  int? id;
  String? name;
  String? category;
  String? inStockDate;
  String? status;
  String? image1;
  String? image2;
  dynamic? atPoint;
  bool? available;
  dynamic? image1Source;
  dynamic? image2Source;

  IssuedCycle(
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

  IssuedCycle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    inStockDate = json['inStockDate'];
    status = json['status'];
    image1 = json['image1'];
    image2 = json['image2'];
    atPoint = json['atPoint'];
    available = json['available'];
    image1Source = json['image1Source'];
    image2Source = json['image2Source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['inStockDate'] = inStockDate;
    data['status'] = status;
    data['image1'] = image1;
    data['image2'] = image2;
    data['atPoint'] = atPoint;
    data['available'] = available;
    data['image1Source'] = image1Source;
    data['image2Source'] = image2Source;
    return data;
  }
}

class AllRequest {
  int? id;
  String? requestedOn;
  dynamic? issuedOn;
  dynamic? surrenderOn;
  String? status;
  User? requestedBy;
  IssuedCycle? requestedFor;
  dynamic? issuedBy;
  dynamic? revokedBy;
  dynamic? revokedPoint;
  IssuedPoint? issuedPoint;

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
    requestedBy = json['requestedBy'] != null ? User.fromJson(json['requestedBy']) : null;
    requestedFor = json['requestedFor'] != null ? IssuedCycle.fromJson(json['requestedFor']) : null;
    issuedBy = json['issuedBy'];
    revokedBy = json['revokedBy'];
    revokedPoint = json['revokedPoint'];
    issuedPoint = json['issuedPoint'] != null ? IssuedPoint.fromJson(json['issuedPoint']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['requestedOn'] = requestedOn;
    data['issuedOn'] = issuedOn;
    data['surrenderOn'] = surrenderOn;
    data['status'] = status;
    if (requestedBy != null) {
      data['requestedBy'] = requestedBy!.toJson();
    }
    if (requestedFor != null) {
      data['requestedFor'] = requestedFor!.toJson();
    }
    data['issuedBy'] = issuedBy;
    data['revokedBy'] = revokedBy;
    data['revokedPoint'] = revokedPoint;
    if (issuedPoint != null) {
      data['issuedPoint'] = issuedPoint!.toJson();
    }
    return data;
  }
}

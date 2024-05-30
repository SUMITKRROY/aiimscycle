import 'dart:convert';

class MakeIssueReqModal {
  int id;
  DateTime requestedOn;
  DateTime? issuedOn;
  DateTime? surrenderOn;
  String status;
  RequestedBy requestedBy;
  RequestedFor requestedFor;
  String? issuedBy;
  String? revokedBy;
  String? revokedPoint;
  IssuedPoint issuedPoint;

  MakeIssueReqModal({
    required this.id,
    required this.requestedOn,
    this.issuedOn,
    this.surrenderOn,
    required this.status,
    required this.requestedBy,
    required this.requestedFor,
    this.issuedBy,
    this.revokedBy,
    this.revokedPoint,
    required this.issuedPoint,
  });

  factory MakeIssueReqModal.fromJson(Map<String, dynamic> json) {
    return MakeIssueReqModal(
      id: json['id'],
      requestedOn: DateTime.parse(json['requestedOn']),
      issuedOn: json['issuedOn'] != null ? DateTime.parse(json['issuedOn']) : null,
      surrenderOn: json['surrenderOn'] != null ? DateTime.parse(json['surrenderOn']) : null,
      status: json['status'],
      requestedBy: RequestedBy.fromJson(json['requestedBy']),
      requestedFor: RequestedFor.fromJson(json['requestedFor']),
      issuedBy: json['issuedBy'],
      revokedBy: json['revokedBy'],
      revokedPoint: json['revokedPoint'],
      issuedPoint: IssuedPoint.fromJson(json['issuedPoint']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'requestedOn': requestedOn.toIso8601String(),
      'issuedOn': issuedOn?.toIso8601String(),
      'surrenderOn': surrenderOn?.toIso8601String(),
      'status': status,
      'requestedBy': requestedBy.toJson(),
      'requestedFor': requestedFor.toJson(),
      'issuedBy': issuedBy,
      'revokedBy': revokedBy,
      'revokedPoint': revokedPoint,
      'issuedPoint': issuedPoint.toJson(),
    };
  }
}

class RequestedBy {
  int userId;
  String employeeCode;
  String role;
  String password;
  int enabled;
  String fullname;
  String contactNo;
  String status;
  String? profile;
  String? idCard;
  String? idCardBack;
  int designation;
  int department;
  String? departmentalPost;
  String? institutePost;
  String? email;
  String registeredOn;
  String? otp;
  String? otpTime;
  String? issuedCycle;
  String? point;

  RequestedBy({
    required this.userId,
    required this.employeeCode,
    required this.role,
    required this.password,
    required this.enabled,
    required this.fullname,
    required this.contactNo,
    required this.status,
    this.profile,
    this.idCard,
    this.idCardBack,
    required this.designation,
    required this.department,
    this.departmentalPost,
    this.institutePost,
    this.email,
    required this.registeredOn,
    this.otp,
    this.otpTime,
    this.issuedCycle,
    this.point,
  });

  factory RequestedBy.fromJson(Map<String, dynamic> json) {
    return RequestedBy(
      userId: json['userId'],
      employeeCode: json['employeeCode'],
      role: json['role'],
      password: json['password'],
      enabled: json['enabled'],
      fullname: json['fullname'],
      contactNo: json['contactNo'],
      status: json['status'],
      profile: json['profile'],
      idCard: json['idCard'],
      idCardBack: json['idCardBack'],
      designation: json['designation'],
      department: json['department'],
      departmentalPost: json['departmentalPost'],
      institutePost: json['institutePost'],
      email: json['email'],
      registeredOn: json['registeredOn'],
      otp: json['otp'],
      otpTime: json['otpTime'],
      issuedCycle: json['issuedCycle'],
      point: json['point'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'employeeCode': employeeCode,
      'role': role,
      'password': password,
      'enabled': enabled,
      'fullname': fullname,
      'contactNo': contactNo,
      'status': status,
      'profile': profile,
      'idCard': idCard,
      'idCardBack': idCardBack,
      'designation': designation,
      'department': department,
      'departmentalPost': departmentalPost,
      'institutePost': institutePost,
      'email': email,
      'registeredOn': registeredOn,
      'otp': otp,
      'otpTime': otpTime,
      'issuedCycle': issuedCycle,
      'point': point,
    };
  }
}

class RequestedFor {
  int id;
  String name;
  String category;
  DateTime inStockDate;
  String status;
  String? image1;
  String? image2;
  AtPoint atPoint;
  bool available;
  String? image1Source;
  String? image2Source;

  RequestedFor({
    required this.id,
    required this.name,
    required this.category,
    required this.inStockDate,
    required this.status,
    this.image1,
    this.image2,
    required this.atPoint,
    required this.available,
    this.image1Source,
    this.image2Source,
  });

  factory RequestedFor.fromJson(Map<String, dynamic> json) {
    return RequestedFor(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      inStockDate: DateTime.parse(json['inStockDate']),
      status: json['status'],
      image1: json['image1'],
      image2: json['image2'],
      atPoint: AtPoint.fromJson(json['atPoint']),
      available: json['available'],
      image1Source: json['image1Source'],
      image2Source: json['image2Source'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'inStockDate': inStockDate.toIso8601String(),
      'status': status,
      'image1': image1,
      'image2': image2,
      'atPoint': atPoint.toJson(),
      'available': available,
      'image1Source': image1Source,
      'image2Source': image2Source,
    };
  }
}

class AtPoint {
  int id;
  String name;
  double longitude;
  double latitude;

  AtPoint({
    required this.id,
    required this.name,
    required this.longitude,
    required this.latitude,
  });

  factory AtPoint.fromJson(Map<String, dynamic> json) {
    return AtPoint(
      id: json['id'],
      name: json['name'],
      longitude: json['longitude'].toDouble(),
      latitude: json['latitude'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'longitude': longitude,
      'latitude': latitude,
    };
  }
}

class IssuedPoint {
  int id;
  String name;
  double longitude;
  double latitude;

  IssuedPoint({
    required this.id,
    required this.name,
    required this.longitude,
    required this.latitude,
  });

  factory IssuedPoint.fromJson(Map<String, dynamic> json) {
    return IssuedPoint(
      id: json['id'],
      name: json['name'],
      longitude: json['longitude'].toDouble(),
      latitude: json['latitude'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'longitude': longitude,
      'latitude': latitude,
    };
  }
}

class User {
  final int? userId;
  final String? employeeCode;
  final String? role;
  final String? password;
  final int? enabled;
  final String? fullname;
  final String? contactNo;
  final String? status;
  final String? profile;
  final String? idCard;
  final String? idCardBack;
  final int? designation;
  final int? department;
  final String? departmentalPost;
  final String? institutePost;
  final String? email;
  final String? registeredOn;
  final String? otp;
  final String? otpTime;
  final String? issuedCycle;
  final int? point;

  User({
    this.userId,
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
    this.point,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] as int?,
      employeeCode: json['employeeCode'] as String?,
      role: json['role'] as String?,
      password: json['password'] as String?,
      enabled: json['enabled'] as int?,
      fullname: json['fullname'] as String?,
      contactNo: json['contactNo'] as String?,
      status: json['status'] as String?,
      profile: json['profile'] as String?,
      idCard: json['idCard'] as String?,
      idCardBack: json['idCardBack'] as String?,
      designation: json['designation'] as int?,
      department: json['department'] as int?,
      departmentalPost: json['departmentalPost'] as String?,
      institutePost: json['institutePost'] as String?,
      email: json['email'] as String?,
      registeredOn: json['registeredOn'] as String?,
      otp: json['otp'] as String?,
      otpTime: json['otpTime'] as String?,
      issuedCycle: json['issuedCycle'] as String?,
      point: json['point'] as int?,
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

// class User {
//   int userId;
//   String employeeCode;
//   String role;
//   String password;
//   int enabled;
//   String? fullname;
//   String contactNo;
//   String status;
//   String? profile;
//   String? idCard;
//   String? idCardBack;
//   int designation;
//   int department;
//   String? departmentalPost;
//   String? institutePost;
//   String? email;
//   String registeredOn;
//   String? otp;
//   String? otpTime;
//   String? issuedCycle;
//   String? point;
//
//   User({
//     required this.userId,
//     required this.employeeCode,
//     required this.role,
//     required this.password,
//     required this.enabled,
//     required this.fullname,
//     required this.contactNo,
//     required this.status,
//     this.profile,
//     this.idCard,
//     this.idCardBack,
//     required this.designation,
//     required this.department,
//     this.departmentalPost,
//     this.institutePost,
//     this.email,
//     required this.registeredOn,
//     this.otp,
//     this.otpTime,
//     this.issuedCycle,
//     this.point,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       userId: json['userId'] ?? 0,
//       employeeCode: json['employeeCode'] ?? '',
//       role: json['role'] ?? '',
//       password: json['password'] ?? '',
//       enabled: json['enabled'] ?? 0,
//       fullname: json['fullname'] ?? '',
//       contactNo: json['contactNo'] ?? '',
//       status: json['status'] ?? '',
//       profile: json['profile'],
//       idCard: json['idCard'],
//       idCardBack: json['idCardBack'],
//       designation: json['designation'] ?? 0,
//       department: json['department'] ?? 0,
//       departmentalPost: json['departmentalPost'],
//       institutePost: json['institutePost'],
//       email: json['email'],
//       registeredOn: json['registeredOn'] ?? '',
//       otp: json['otp'],
//       otpTime: json['otpTime'],
//       issuedCycle: json['issuedCycle'],
//       point: json['point'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'userId': userId,
//       'employeeCode': employeeCode,
//       'role': role,
//       'password': password,
//       'enabled': enabled,
//       'fullname': fullname,
//       'contactNo': contactNo,
//       'status': status,
//       'profile': profile,
//       'idCard': idCard,
//       'idCardBack': idCardBack,
//       'designation': designation,
//       'department': department,
//       'departmentalPost': departmentalPost,
//       'institutePost': institutePost,
//       'email': email,
//       'registeredOn': registeredOn,
//       'otp': otp,
//       'otpTime': otpTime,
//       'issuedCycle': issuedCycle,
//       'point': point,
//     };
//   }
// }
//
// class Request {
//   int id;
//   String requestedOn;
//   String? issuedOn;
//   String? surrenderOn;
//   String status;
//   User requestedBy;
//   Cycle requestedFor;
//   User? issuedBy;
//   User? revokedBy;
//   Point? revokedPoint;
//   Point issuedPoint;
//
//   Request({
//     required this.id,
//     required this.requestedOn,
//     this.issuedOn,
//     this.surrenderOn,
//     required this.status,
//     required this.requestedBy,
//     required this.requestedFor,
//     this.issuedBy,
//     this.revokedBy,
//     this.revokedPoint,
//     required this.issuedPoint,
//   });
//
//   factory Request.fromJson(Map<String, dynamic> json) {
//     return Request(
//       id: json['id'] ?? 0,
//       requestedOn: json['requestedOn'] ?? '',
//       issuedOn: json['issuedOn'],
//       surrenderOn: json['surrenderOn'],
//       status: json['status'] ?? '',
//       requestedBy: User.fromJson(json['requestedBy']),
//       requestedFor: Cycle.fromJson(json['requestedFor']),
//       issuedBy: json['issuedBy'] != null ? User.fromJson(json['issuedBy']) : null,
//       revokedBy: json['revokedBy'] != null ? User.fromJson(json['revokedBy']) : null,
//       revokedPoint: json['revokedPoint'] != null ? Point.fromJson(json['revokedPoint']) : null,
//       issuedPoint: Point.fromJson(json['issuedPoint']),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'requestedOn': requestedOn,
//       'issuedOn': issuedOn,
//       'surrenderOn': surrenderOn,
//       'status': status,
//       'requestedBy': requestedBy.toJson(),
//       'requestedFor': requestedFor.toJson(),
//       'issuedBy': issuedBy?.toJson(),
//       'revokedBy': revokedBy?.toJson(),
//       'revokedPoint': revokedPoint?.toJson(),
//       'issuedPoint': issuedPoint.toJson(),
//     };
//   }
// }
//
// class Cycle {
//   int id;
//   String name;
//   String category;
//   String inStockDate;
//   String status;
//   String image1;
//   String image2;
//   Point atPoint;
//   bool available;
//   String? image1Source;
//   String? image2Source;
//
//   Cycle({
//     required this.id,
//     required this.name,
//     required this.category,
//     required this.inStockDate,
//     required this.status,
//     required this.image1,
//     required this.image2,
//     required this.atPoint,
//     required this.available,
//     this.image1Source,
//     this.image2Source,
//   });
//
//   factory Cycle.fromJson(Map<String, dynamic> json) {
//     return Cycle(
//       id: json['id'] ?? 0,
//       name: json['name'] ?? '',
//       category: json['category'] ?? '',
//       inStockDate: json['inStockDate'] ?? '',
//       status: json['status'] ?? '',
//       image1: json['image1'] ?? '',
//       image2: json['image2'] ?? '',
//       atPoint: Point.fromJson(json['atPoint']),
//       available: json['available'] ?? false,
//       image1Source: json['image1Source'],
//       image2Source: json['image2Source'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'category': category,
//       'inStockDate': inStockDate,
//       'status': status,
//       'image1': image1,
//       'image2': image2,
//       'atPoint': atPoint.toJson(),
//       'available': available,
//       'image1Source': image1Source,
//       'image2Source': image2Source,
//     };
//   }
// }
//
// class Point {
//   int id;
//   String name;
//   double longitude;
//   double latitude;
//
//   Point({
//     required this.id,
//     required this.name,
//     required this.longitude,
//     required this.latitude,
//   });
//
//   factory Point.fromJson(Map<String, dynamic> json) {
//     return Point(
//       id: json['id'] ?? 0,
//       name: json['name'] ?? '',
//       longitude: json['longitude']?.toDouble() ?? 0.0,
//       latitude: json['latitude']?.toDouble() ?? 0.0,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'longitude': longitude,
//       'latitude': latitude,
//     };
//   }
// }
//
// class AllRequest {
//   User user;
//   List<Request> allRequest;
//
//   AllRequest({
//     required this.user,
//     required this.allRequest,
//   });
//
//   factory AllRequest.fromJson(Map<String, dynamic> json) {
//     return AllRequest(
//       user: User.fromJson(json['user']),
//       allRequest: (json['allRequest'] as List).map((i) => Request.fromJson(i)).toList(),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'user': user.toJson(),
//       'allRequest': allRequest.map((request) => request.toJson()).toList(),
//     };
//   }
// }

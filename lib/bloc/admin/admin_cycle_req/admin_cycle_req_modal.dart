class AdminIssueReqModal {
  int? id;
  String? requestedOn;
  dynamic issuedOn;
  dynamic surrenderOn;
  String? status;
  RequestedBy? requestedBy;
  RequestedFor? requestedFor;
  dynamic issuedBy;
  dynamic revokedBy;
  dynamic revokedPoint;
  IssuedPoint? issuedPoint;

  AdminIssueReqModal({
    this.id,
    this.requestedOn,
    this.issuedOn,
    this.surrenderOn,
    this.status,
    this.requestedBy,
    this.requestedFor,
    this.issuedBy,
    this.revokedBy,
    this.revokedPoint,
    this.issuedPoint,
  });

  factory AdminIssueReqModal.fromJson(Map<String, dynamic> json) => AdminIssueReqModal(
        id: json["id"] as int?,
        requestedOn: json["requestedOn"] as String?,
        issuedOn: json["issuedOn"],
        surrenderOn: json["surrenderOn"],
        status: json["status"] as String?,
        requestedBy: json["requestedBy"] != null ? RequestedBy.fromJson(json["requestedBy"]) : null,
        requestedFor:
            json["requestedFor"] != null ? RequestedFor.fromJson(json["requestedFor"]) : null,
        issuedBy: json["issuedBy"],
        revokedBy: json["revokedBy"],
        revokedPoint: json["revokedPoint"],
        issuedPoint: json["issuedPoint"] != null ? IssuedPoint.fromJson(json["issuedPoint"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "requestedOn": requestedOn,
        "issuedOn": issuedOn,
        "surrenderOn": surrenderOn,
        "status": status,
        "requestedBy": requestedBy?.toJson(),
        "requestedFor": requestedFor?.toJson(),
        "issuedBy": issuedBy,
        "revokedBy": revokedBy,
        "revokedPoint": revokedPoint,
        "issuedPoint": issuedPoint?.toJson(),
      };
}

class RequestedBy {
  int? userId;
  String? employeeCode;
  String? role;
  String? password;
  int? enabled;
  String? fullname;
  String? contactNo;
  String? status;
  dynamic profile;
  dynamic idCard;
  dynamic idCardBack;
  int? designation;
  int? department;
  dynamic departmentalPost;
  dynamic institutePost;
  dynamic email;
  String? registeredOn;
  dynamic otp;
  dynamic otpTime;
  dynamic issuedCycle;
  dynamic point;

  RequestedBy({
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

  factory RequestedBy.fromJson(Map<String, dynamic> json) => RequestedBy(
        userId: json["userId"] as int?,
        employeeCode: json["employeeCode"] as String?,
        role: json["role"] as String?,
        password: json["password"] as String?,
        enabled: json["enabled"] as int?,
        fullname: json["fullname"] as String?,
        contactNo: json["contactNo"] as String?,
        status: json["status"] as String?,
        profile: json["profile"],
        idCard: json["idCard"],
        idCardBack: json["idCardBack"],
        designation: json["designation"] as int?,
        department: json["department"] as int?,
        departmentalPost: json["departmentalPost"],
        institutePost: json["institutePost"],
        email: json["email"],
        registeredOn: json["registeredOn"] as String?,
        otp: json["otp"],
        otpTime: json["otpTime"],
        issuedCycle: json["issuedCycle"],
        point: json["point"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "employeeCode": employeeCode,
        "role": role,
        "password": password,
        "enabled": enabled,
        "fullname": fullname,
        "contactNo": contactNo,
        "status": status,
        "profile": profile,
        "idCard": idCard,
        "idCardBack": idCardBack,
        "designation": designation,
        "department": department,
        "departmentalPost": departmentalPost,
        "institutePost": institutePost,
        "email": email,
        "registeredOn": registeredOn,
        "otp": otp,
        "otpTime": otpTime,
        "issuedCycle": issuedCycle,
        "point": point,
      };
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
  dynamic image1Source;
  dynamic image2Source;

  RequestedFor({
    this.id,
    this.name,
    this.category,
    this.inStockDate,
    this.status,
    this.image1,
    this.image2,
    this.atPoint,
    this.available,
    this.image1Source,
    this.image2Source,
  });

  factory RequestedFor.fromJson(Map<String, dynamic> json) => RequestedFor(
        id: json["id"] as int?,
        name: json["name"] as String?,
        category: json["category"] as String?,
        inStockDate: json["inStockDate"] as String?,
        status: json["status"] as String?,
        image1: json["image1"] as String?,
        image2: json["image2"] as String?,
        atPoint: json["atPoint"] != null ? AtPoint.fromJson(json["atPoint"]) : null,
        available: json["available"] as bool?,
        image1Source: json["image1Source"],
        image2Source: json["image2Source"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "inStockDate": inStockDate,
        "status": status,
        "image1": image1,
        "image2": image2,
        "atPoint": atPoint?.toJson(),
        "available": available,
        "image1Source": image1Source,
        "image2Source": image2Source,
      };
}

class AtPoint {
  int? id;
  String? name;
  double? longitude;
  double? latitude;

  AtPoint({
    this.id,
    this.name,
    this.longitude,
    this.latitude,
  });

  factory AtPoint.fromJson(Map<String, dynamic> json) => AtPoint(
        id: json["id"] as int?,
        name: json["name"] as String?,
        longitude: json["longitude"] as double?,
        latitude: json["latitude"] as double?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "longitude": longitude,
        "latitude": latitude,
      };
}

class IssuedPoint {
  int? id;
  String? name;
  double? longitude;
  double? latitude;

  IssuedPoint({
    this.id,
    this.name,
    this.longitude,
    this.latitude,
  });

  factory IssuedPoint.fromJson(Map<String, dynamic> json) => IssuedPoint(
        id: json["id"] as int?,
        name: json["name"] as String?,
        longitude: json["longitude"] as double?,
        latitude: json["latitude"] as double?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "longitude": longitude,
        "latitude": latitude,
      };
}

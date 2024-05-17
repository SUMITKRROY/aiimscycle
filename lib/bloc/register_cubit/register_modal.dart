class RegisterModal {
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
  Null? otp;
  Null? otpTime;
  Null? issuedCycle;
  Null? point;

  RegisterModal(
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

  RegisterModal.fromJson(Map<String, dynamic> json) {
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

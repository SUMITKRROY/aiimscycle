class LoginModal {
  Authenticate? authenticate;
  String? message;

  LoginModal({this.authenticate, this.message});

  LoginModal.fromJson(Map<String, dynamic> json) {
    authenticate =
        json['authenticate'] != null ? new Authenticate.fromJson(json['authenticate']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.authenticate != null) {
      data['authenticate'] = this.authenticate!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Authenticate {
  List<Authorities>? authorities;
  Details? details;
  bool? authenticated;
  String? principal;
  Null? credentials;
  String? name;

  Authenticate(
      {this.authorities,
      this.details,
      this.authenticated,
      this.principal,
      this.credentials,
      this.name});

  Authenticate.fromJson(Map<String, dynamic> json) {
    if (json['authorities'] != null) {
      authorities = <Authorities>[];
      json['authorities'].forEach((v) {
        authorities!.add(new Authorities.fromJson(v));
      });
    }
    details = json['details'] != null ? new Details.fromJson(json['details']) : null;
    authenticated = json['authenticated'];
    principal = json['principal'];
    credentials = json['credentials'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.authorities != null) {
      data['authorities'] = this.authorities!.map((v) => v.toJson()).toList();
    }
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    data['authenticated'] = this.authenticated;
    data['principal'] = this.principal;
    data['credentials'] = this.credentials;
    data['name'] = this.name;
    return data;
  }
}

class Authorities {
  String? authority;

  Authorities({this.authority});

  Authorities.fromJson(Map<String, dynamic> json) {
    authority = json['authority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authority'] = this.authority;
    return data;
  }
}

class Details {
  String? remoteAddress;
  String? sessionId;

  Details({this.remoteAddress, this.sessionId});

  Details.fromJson(Map<String, dynamic> json) {
    remoteAddress = json['remoteAddress'];
    sessionId = json['sessionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['remoteAddress'] = this.remoteAddress;
    data['sessionId'] = this.sessionId;
    return data;
  }
}

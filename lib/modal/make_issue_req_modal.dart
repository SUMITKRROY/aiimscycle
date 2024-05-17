class MakeIssueReqModal {
  // Null? cause;
  List<StackTrace>? stackTrace;
  String? message;
  List<Null>? suppressed;
  String? localizedMessage;

  MakeIssueReqModal({
    // this.cause,
    this.stackTrace,
    this.message,
    this.suppressed,
    this.localizedMessage,
  });

  MakeIssueReqModal.fromJson(Map<String, dynamic> json) {
    // cause = json['cause'];
    if (json['stackTrace'] != null) {
      stackTrace = <StackTrace>[];
      json['stackTrace'].forEach((v) {
        stackTrace!.add(new StackTrace.fromJson(v));
      });
    }
    message = json['message'];
    // if (json['suppressed'] != null) {
    //   suppressed = <Null>[];
    //   json['suppressed'].forEach((v) {
    //     suppressed!.add(Null.fromJson(v));
    //   });
    // }
    localizedMessage = json['localizedMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['cause'] = this.cause;
    if (this.stackTrace != null) {
      data['stackTrace'] = this.stackTrace!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    if (this.suppressed != null) {
      // data['suppressed'] = this.suppressed!.map((v) => v.toJson()).toList();
    }
    data['localizedMessage'] = this.localizedMessage;
    return data;
  }
}

class StackTrace {
  Null? classLoaderName;
  String? moduleName;
  String? moduleVersion;
  String? methodName;
  String? fileName;
  int? lineNumber;
  String? className;
  bool? nativeMethod;

  StackTrace(
      {this.classLoaderName,
      this.moduleName,
      this.moduleVersion,
      this.methodName,
      this.fileName,
      this.lineNumber,
      this.className,
      this.nativeMethod});

  StackTrace.fromJson(Map<String, dynamic> json) {
    classLoaderName = json['classLoaderName'];
    moduleName = json['moduleName'];
    moduleVersion = json['moduleVersion'];
    methodName = json['methodName'];
    fileName = json['fileName'];
    lineNumber = json['lineNumber'];
    className = json['className'];
    nativeMethod = json['nativeMethod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classLoaderName'] = this.classLoaderName;
    data['moduleName'] = this.moduleName;
    data['moduleVersion'] = this.moduleVersion;
    data['methodName'] = this.methodName;
    data['fileName'] = this.fileName;
    data['lineNumber'] = this.lineNumber;
    data['className'] = this.className;
    data['nativeMethod'] = this.nativeMethod;
    return data;
  }
}

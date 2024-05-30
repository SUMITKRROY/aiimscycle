class LogDataClass {
  String? id;
  String? clientId;
  String? description;
  String? screenName;
  String? date;
  String? time;

  LogDataClass({
    this.id,
    this.clientId,
    this.description,
    this.screenName,
    this.date,
    this.time,
  });

  factory LogDataClass.fromJson(Map<String, dynamic> json) {
    return LogDataClass(
      id: json['id'],
      clientId: json['clientId'],
      description: json['description'],
      screenName: json['screenName'],
      date: json['date'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'clientId': clientId,
      'description': description,
      'screenName': screenName,
      'date': date,
      'time': time,
    };
  }
}

// List<LogDataClass> myList = [
//   LogDataClass(
//       id: 'data', screenName: 'data', description: 'data', date: '08-05-2024', clientId: 'data'),
//   LogDataClass(
//       id: 'data', screenName: 'data', description: 'data', date: '07-05-2024', clientId: 'data'),
//   LogDataClass(
//       id: 'data', screenName: 'data', description: 'data', date: '03-05-2024', clientId: 'data'),
//   LogDataClass(
//       id: 'data', screenName: 'data', description: 'data', date: '25-04-2024', clientId: 'data'),
//   LogDataClass(
//       id: 'data', screenName: 'data', description: 'data', date: '01-05-2024', clientId: 'data'),
//   LogDataClass(
//       id: 'data', screenName: 'data', description: 'data', date: '15-04-2024', clientId: 'data'),
//   LogDataClass(
//       id: 'data', screenName: 'data', description: 'data', date: '29-03-2024', clientId: 'data'),
// ];

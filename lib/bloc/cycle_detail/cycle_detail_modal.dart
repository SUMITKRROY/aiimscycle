class CycleDetailModal {
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

  CycleDetailModal({
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

  factory CycleDetailModal.fromJson(Map<String, dynamic> json) {
    return CycleDetailModal(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      inStockDate: json['inStockDate'],
      status: json['status'],
      image1: json['image1'],
      image2: json['image2'],
      atPoint: json['atPoint'] != null ? AtPoint.fromJson(json['atPoint']) : null,
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
      'inStockDate': inStockDate,
      'status': status,
      'image1': image1,
      'image2': image2,
      'atPoint': atPoint?.toJson(),
      'available': available,
      'image1Source': image1Source,
      'image2Source': image2Source,
    };
  }
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

  factory AtPoint.fromJson(Map<String, dynamic> json) {
    return AtPoint(
      id: json['id'],
      name: json['name'],
      longitude: json['longitude'],
      latitude: json['latitude'],
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

class CycleInventoryModal {
  int? id;
  String? name;
  String? category;
  String? inStockDate;
  String? status;
  String? image1;
  String? image2;
  AtPoint? atPoint;
  bool? available;
  String? image1Source;
  String? image2Source;

  CycleInventoryModal({
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

  factory CycleInventoryModal.fromJson(Map<String, dynamic> json) {
    return CycleInventoryModal(
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
}

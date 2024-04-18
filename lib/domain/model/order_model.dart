class OrderModel {
  final int? id;
  final int? carId;
  final int? type;
  final int? regionId;
  final int? districtId;
  final String? description;
  final String? images;
  final bool? isEvacuated;
  final DateTime? completedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  OrderModel({
    this.id,
    this.carId,
    this.type,
    this.regionId,
    this.districtId,
    this.description,
    this.images,
    this.isEvacuated,
    this.completedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        carId: json["car_id"],
        type: json["type"],
        regionId: json["region_id"],
        districtId: json["district_id"],
        description: json["description"],
        images: json["images"],
        isEvacuated: json["is_evacuated"],
        completedAt: json["completed_at"] == null
            ? null
            : DateTime.tryParse(json["completed_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "car_id": carId,
        "type": type,
        "region_id": regionId,
        "district_id": districtId,
        "description": description,
        "images": images,
        "is_evacuated": isEvacuated,
        "completed_at": completedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

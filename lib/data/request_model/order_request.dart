class OrderRequest {
  final int? carId;
  final int? type;
  final int? regionId;
  final int? districtId;
  final String? description;
  final List<String>? images;
  final bool? isEvacuated;

  OrderRequest({
    this.carId,
    this.type,
    this.regionId,
    this.districtId,
    this.description,
    this.images,
    this.isEvacuated,
  });

  factory OrderRequest.fromJson(Map<String, dynamic> json) => OrderRequest(
        carId: json["car_id"],
        type: json["type"],
        regionId: json["region_id"],
        districtId: json["district_id"],
        description: json["description"],
        isEvacuated: json["is_evacuated"],
      );

  Map<String, dynamic> toJson() => {
        "car_id": carId,
        "type": type,
        "region_id": regionId,
        "district_id": districtId,
        "description": description,
        "is_evacuated": isEvacuated == true ? 1 : 0,
      };
}

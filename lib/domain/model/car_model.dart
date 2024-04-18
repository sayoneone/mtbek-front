class CarModel {
  int? id;
  String? license;
  int? brandId;
  int? modelId;
  String? vin;
  int? year;
  List<String>? images;
  DateTime? createdAt;
  DateTime? updatedAt;

  CarModel({
    this.id,
    this.license,
    this.brandId,
    this.modelId,
    this.vin,
    this.year,
    this.images,
    this.createdAt,
    this.updatedAt,
  });

  CarModel copyWith({
    int? id,
    String? license,
    int? brandId,
    int? modelId,
    String? vin,
    int? year,
    List<String>? images,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      CarModel(
        id: id ?? this.id,
        license: license ?? this.license,
        brandId: brandId ?? this.brandId,
        modelId: modelId ?? this.modelId,
        vin: vin ?? this.vin,
        year: year ?? this.year,
        images: images ?? this.images,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        id: json["id"],
        license: json["license"],
        brandId: json["brand_id"],
        modelId: json["model_id"],
        vin: json["vin"],
        year: json["year"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "license": license,
        "brand_id": brandId,
        "model_id": modelId,
        "vin": vin,
        "year": year,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

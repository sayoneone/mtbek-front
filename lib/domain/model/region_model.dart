class RegionsResponseModel {
  String? message;
  List<RegionModel>? data;

  RegionsResponseModel({
    this.message,
    this.data,
  });

  RegionsResponseModel copyWith({
    String? message,
    List<RegionModel>? data,
  }) =>
      RegionsResponseModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory RegionsResponseModel.fromJson(Map<String, dynamic> json) =>
      RegionsResponseModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<RegionModel>.from(
                json["data"]!.map((x) => RegionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class RegionModel {
  int? id;
  String? name;
  int? parentId;
  DateTime? createdAt;
  DateTime? updatedAt;

  RegionModel({
    this.id,
    this.name,
    this.parentId,
    this.createdAt,
    this.updatedAt,
  });

  RegionModel copyWith({
    int? id,
    String? name,
    int? parentId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      RegionModel(
        id: id ?? this.id,
        name: name ?? this.name,
        parentId: parentId ?? this.parentId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

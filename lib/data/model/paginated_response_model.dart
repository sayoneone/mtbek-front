abstract class PaginatedResponseModel {
  String? message;

  PaginatedResponseModel({
    this.message,
  });

  PaginatedResponseModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}

abstract class DataPaginatedResponseModel {
  int? currentPage;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<DataLinkModel>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  DataPaginatedResponseModel({
    this.currentPage,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  DataPaginatedResponseModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}

class DataLinkModel {
  String? url;
  String? label;
  bool? active;

  DataLinkModel({
    this.url,
    this.label,
    this.active,
  });

  DataLinkModel copyWith({
    String? url,
    String? label,
    bool? active,
  }) =>
      DataLinkModel(
        url: url ?? this.url,
        label: label ?? this.label,
        active: active ?? this.active,
      );

  factory DataLinkModel.fromJson(Map<String, dynamic> json) => DataLinkModel(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

import 'package:mtbek_front/domain/model/car_model.dart';
import 'package:mtbek_front/data/model/paginated_response_model.dart';

class CarsPaginatedResponseModel extends PaginatedResponseModel {
  DataCarsPaginatedResponseModel? payload;

  CarsPaginatedResponseModel({
    super.message,
    this.payload,
  });

  @override
  factory CarsPaginatedResponseModel.fromJson(Map<String, dynamic> json) {
    return CarsPaginatedResponseModel(
      message: json["message"],
      payload: json["data"] == null
          ? null
          : DataCarsPaginatedResponseModel.fromJson(
              json["data"],
            ),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "message": message,
        "data": payload?.toJson(),
      };
}

class DataCarsPaginatedResponseModel extends DataPaginatedResponseModel {
  List<CarModel>? data;

  DataCarsPaginatedResponseModel({
    this.data,
    super.currentPage,
    super.lastPage,
    super.perPage,
    super.total,
    super.firstPageUrl,
    super.lastPageUrl,
    super.nextPageUrl,
    super.prevPageUrl,
    super.path,
    super.from,
    super.to,
    super.links,
  });

  factory DataCarsPaginatedResponseModel.fromJson(Map<String, dynamic> json) {
    return DataCarsPaginatedResponseModel(
      data: json["data"] == null
          ? []
          : List<CarModel>.from(
              json["data"]!.map(
                (x) => CarModel.fromJson(x),
              ),
            ),
      currentPage: json["current_page"],
      lastPage: json["last_page"],
      perPage: json["per_page"],
      total: json["total"],
      firstPageUrl: json["first_page_url"],
      lastPageUrl: json["last_page_url"],
      nextPageUrl: json["next_page_url"],
      prevPageUrl: json["prev_page_url"],
      path: json["path"],
      from: json["from"],
      to: json["to"],
      links: json["links"] == null
          ? []
          : List<DataLinkModel>.from(
              json["links"]?.map(
                (x) => DataLinkModel.fromJson(x),
              ),
            ),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<DataCarsPaginatedResponseModel>.from(
                data!.map(
                  (x) => x.toJson(),
                ),
              ),
        "current_page": currentPage,
        "last_page": lastPage,
        "per_page": perPage,
        "total": total,
        "first_page_url": firstPageUrl,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "prev_page_url": prevPageUrl,
        "path": path,
        "from": from,
        "to": to,
        "links": links == null
            ? []
            : List<DataLinkModel>.from(
                links!.map(
                  (x) => x.toJson(),
                ),
              ),
      };
}

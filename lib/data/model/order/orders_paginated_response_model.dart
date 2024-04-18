import 'package:mtbek_front/data/model/paginated_response_model.dart';
import 'package:mtbek_front/domain/model/order_model.dart';

class OrdersPaginatedResponseModel extends PaginatedResponseModel {
  DataOrdersPaginatedResponseModel? payload;

  OrdersPaginatedResponseModel({
    super.message,
    this.payload,
  });

  @override
  factory OrdersPaginatedResponseModel.fromJson(Map<String, dynamic> json) {
    return OrdersPaginatedResponseModel(
      message: json["message"],
      payload: json["data"] == null
          ? null
          : DataOrdersPaginatedResponseModel.fromJson(
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

class DataOrdersPaginatedResponseModel extends DataPaginatedResponseModel {
  List<OrderModel>? data;

  DataOrdersPaginatedResponseModel({
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

  factory DataOrdersPaginatedResponseModel.fromJson(Map<String, dynamic> json) {
    return DataOrdersPaginatedResponseModel(
      data: json["data"] == null
          ? []
          : List<OrderModel>.from(
              json["data"]!.map(
                (x) => OrderModel.fromJson(x),
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
          ? null
          : List<DataLinkModel>.from(
              json["links"].map(
                (x) => DataLinkModel.fromJson(x),
              ),
            ),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(
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
            ? null
            : List<dynamic>.from(
                links!.map(
                  (x) => x.toJson(),
                ),
              ),
      };
}

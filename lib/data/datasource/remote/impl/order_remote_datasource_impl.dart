import 'package:mtbek_front/core/pagination/pagination_model.dart';
import 'package:mtbek_front/core/shared/http.dart';
import 'package:mtbek_front/data/datasource/remote/abstract/order_remote_datasource.dart';
import 'package:mtbek_front/data/request_model/order_request.dart';
import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/domain/model/order_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrderRemoteDataSource)
class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final Http http;

  const OrderRemoteDataSourceImpl({
    required this.http,
  });

  @override
  Future<void> createOrder({
    required OrderRequest request,
  }) async {
    List<MapEntry<String, MultipartFile>> photoes = [];

    try {
      for (var i = 0; i < (request.images ?? []).length; i++) {
        photoes.add(
          MapEntry(
              "images[$i]", MultipartFile.fromFileSync(request.images![i])),
        );
      }

      await http.postMultipartRequest(
        'api/v1/orders',
        body: request.toJson(),
        multipartFiles: photoes,
      );
    } catch (err) {
      // return null;
      rethrow;
    }
  }

  @override
  Future<PaginationModel<OrderModel>?> getUserOrders({
    int? page,
    DateTime? startDate,
    DateTime? endDate,
    String? searchQuery,
    DictionaryModel? status,
    int? visibleItemsCount,
  }) async {
    final response = await http.get(
      'api/v1/orders',
      query: {
        if (page != null) "page": page,
        if (startDate != null) "start_date": startDate,
        if (endDate != null) "end_date": endDate,
        if (searchQuery != null) "search_query": searchQuery,
        if (status?.id != null) "status": status?.id,
        if (visibleItemsCount != null) "visibleItemsCount": visibleItemsCount,
      },
    );
    final pagination = PaginationModel<OrderModel>.fromJson(
      response['data'],
      OrderModel.fromJson,
    );

    return pagination;
  }

  @override
  Future<List<DictionaryModel>?> getOrderTypes() async {
    try {
      final List response = await http.get(
        'api/v1/orders/types',
      );
      return List<DictionaryModel>.from(
        response.map(
          (x) => DictionaryModel.fromJson(x),
        ),
      );
    } catch (err) {
      rethrow;
    }
  }
}

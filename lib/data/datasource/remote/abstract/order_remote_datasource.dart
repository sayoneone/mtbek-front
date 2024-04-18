import 'package:mtbek_front/core/pagination/pagination_model.dart';
import 'package:mtbek_front/data/request_model/order_request.dart';
import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/domain/model/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<void> createOrder({
    required OrderRequest request,
  });

  Future<PaginationModel<OrderModel>?> getUserOrders({
    int? page,
    DateTime? startDate,
    DateTime? endDate,
    String? searchQuery,
    DictionaryModel? status,
    int? visibleItemsCount,
  });

  Future<List<DictionaryModel>?> getOrderTypes();
}

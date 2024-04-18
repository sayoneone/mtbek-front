import 'package:mtbek_front/core/pagination/pagination_model.dart';
import 'package:mtbek_front/data/datasource/remote/abstract/order_remote_datasource.dart';
import 'package:mtbek_front/data/request_model/order_request.dart';
import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/domain/model/order_model.dart';
import 'package:mtbek_front/domain/repository/order_repostory.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource ordersRemoteDataSource;

  OrderRepositoryImpl({
    required this.ordersRemoteDataSource,
  });

  @override
  Future<void> createOrder({
    required OrderRequest request,
  }) async =>
      await ordersRemoteDataSource.createOrder(
        request: request,
      );

  @override
  Future<PaginationModel<OrderModel>?> getUserOrders({
    int? page,
    DateTime? startDate,
    DateTime? endDate,
    DictionaryModel? status,
    String? searchQuery,
    int? visibleItemsCount,
  }) async =>
      await ordersRemoteDataSource.getUserOrders(
        page: page,
        startDate: startDate,
        endDate: endDate,
        status: status,
        searchQuery: searchQuery,
        visibleItemsCount: visibleItemsCount,
      );

  @override
  Future<List<DictionaryModel>?> getOrderTypes() async =>
      await ordersRemoteDataSource.getOrderTypes();
}

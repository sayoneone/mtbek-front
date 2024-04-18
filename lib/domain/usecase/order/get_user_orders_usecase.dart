import 'package:mtbek_front/core/pagination/pagination_model.dart';
import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/domain/model/order_model.dart';
import 'package:mtbek_front/domain/repository/order_repostory.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

class GetUserOrdersUseCaseParams {
  final int? page;
  final DateTime? startDate;
  final DateTime? endDate;
  final DictionaryModel? status;
  final String? searchQuery;
  final int? visibleItemsCount;

  GetUserOrdersUseCaseParams({
    this.page,
    this.startDate,
    this.endDate,
    this.status,
    this.searchQuery,
    this.visibleItemsCount,
  });
}

@lazySingleton
class GetUserOrdersUseCase
    implements
        UseCase<PaginationModel<OrderModel>?, GetUserOrdersUseCaseParams> {
  final OrderRepository repository;

  GetUserOrdersUseCase({
    required this.repository,
  });

  @override
  Future<PaginationModel<OrderModel>?> call(
          GetUserOrdersUseCaseParams params) async =>
      await repository.getUserOrders(
        page: params.page,
        startDate: params.startDate,
        endDate: params.endDate,
        status: params.status,
        searchQuery: params.searchQuery,
        visibleItemsCount: params.visibleItemsCount,
      );
}

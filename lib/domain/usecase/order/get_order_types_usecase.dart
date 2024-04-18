import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/domain/repository/order_repostory.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetOrderTypesUseCase
    implements UseCase<List<DictionaryModel>?, NoParams> {
  final OrderRepository repository;

  const GetOrderTypesUseCase({
    required this.repository,
  });

  @override
  Future<List<DictionaryModel>?> call(NoParams params) async =>
      (await repository.getOrderTypes());
}

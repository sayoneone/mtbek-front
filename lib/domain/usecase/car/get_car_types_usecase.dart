import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/domain/repository/car_repository.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCarTypesUseCase implements UseCase<List<DictionaryModel>, NoParams> {
  final CarRepository repository;

  const GetCarTypesUseCase({
    required this.repository,
  });

  @override
  Future<List<DictionaryModel>> call(NoParams params) async =>
      await repository.getCarTypes();
}

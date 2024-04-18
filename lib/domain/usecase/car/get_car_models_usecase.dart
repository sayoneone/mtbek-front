import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/domain/repository/car_repository.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

class GetCarModelsUseCaseParams {
  final DictionaryModel selectedCarBrand;

  const GetCarModelsUseCaseParams({
    required this.selectedCarBrand,
  });
}

@lazySingleton
class GetCarModelsUseCase
    implements UseCase<List<DictionaryModel>, GetCarModelsUseCaseParams> {
  final CarRepository repository;

  const GetCarModelsUseCase({
    required this.repository,
  });

  @override
  Future<List<DictionaryModel>> call(GetCarModelsUseCaseParams params) async =>
      await repository.getCarModels(
        selectedCarBrand: params.selectedCarBrand,
      );
}

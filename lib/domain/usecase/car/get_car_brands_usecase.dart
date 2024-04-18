import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/domain/repository/car_repository.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

class GetCarBrandsUseCaseParams {
  final DictionaryModel? selectedCarType;
  final DictionaryModel? selectedCarSubtype;

  const GetCarBrandsUseCaseParams({
    required this.selectedCarType,
    required this.selectedCarSubtype,
  });
}

@lazySingleton
class GetCarBrandsUseCase
    implements UseCase<List<DictionaryModel>, GetCarBrandsUseCaseParams> {
  final CarRepository repository;

  const GetCarBrandsUseCase({
    required this.repository,
  });

  @override
  Future<List<DictionaryModel>> call(GetCarBrandsUseCaseParams params) async =>
      await repository.getCarBrands(
        selectedCarType: params.selectedCarType,
        selectedCarSubtype: params.selectedCarSubtype,
      );
}

import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/domain/repository/car_repository.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

class GetCarSubtypesUseCaseParams {
  final DictionaryModel selectedCarType;

  const GetCarSubtypesUseCaseParams({
    required this.selectedCarType,
  });
}

@lazySingleton
class GetCarSubtypesUseCase
    implements UseCase<List<DictionaryModel>, GetCarSubtypesUseCaseParams> {
  final CarRepository repository;

  const GetCarSubtypesUseCase({
    required this.repository,
  });

  @override
  Future<List<DictionaryModel>> call(
          GetCarSubtypesUseCaseParams params) async =>
      await repository.getCarSubtypes(
        selectedCarType: params.selectedCarType,
      );
}

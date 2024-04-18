import 'package:mtbek_front/domain/model/car_model.dart';
import 'package:mtbek_front/domain/repository/car_repository.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserCarsUseCase implements UseCase<List<CarModel>, NoParams> {
  final CarRepository repository;

  const GetUserCarsUseCase({
    required this.repository,
  });

  @override
  Future<List<CarModel>> call(NoParams params) async =>
      await repository.getCarsNoPagination();
}

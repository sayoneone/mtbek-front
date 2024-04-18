import 'package:mtbek_front/data/model/car/cars_paginated_response_model.dart';
import 'package:mtbek_front/domain/repository/car_repository.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

class GetUserCarsPaginatedUseCaseParams {
  final int page;
  final String? query;
  final int? creationYear;

  const GetUserCarsPaginatedUseCaseParams({
    required this.page,
    this.creationYear,
    this.query,
  });
}

@lazySingleton
class GetUserCarsPaginatedUseCase
    implements
        UseCase<CarsPaginatedResponseModel, GetUserCarsPaginatedUseCaseParams> {
  final CarRepository repository;

  const GetUserCarsPaginatedUseCase({
    required this.repository,
  });

  @override
  Future<CarsPaginatedResponseModel> call(
          GetUserCarsPaginatedUseCaseParams params) async =>
      await repository.getUserCars(
        page: params.page,
        query: params.query,
        creationYear: params.creationYear,
      );
}

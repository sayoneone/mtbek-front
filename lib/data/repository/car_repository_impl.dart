import 'package:mtbek_front/data/datasource/remote/abstract/car_remote_datasource.dart';
import 'package:mtbek_front/data/model/car/cars_paginated_response_model.dart';
import 'package:mtbek_front/domain/model/car_model.dart';
import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/domain/repository/car_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CarRepository)
class CarRepisoryImpl implements CarRepository {
  final CarRemoteDataSource carRemoteDataSource;

  const CarRepisoryImpl({
    required this.carRemoteDataSource,
  });

  @override
  Future<CarsPaginatedResponseModel> getUserCars({
    required int page,
    String? query,
    int? creationYear,
  }) async =>
      await carRemoteDataSource.getUserCars(
        page: page,
      );

  @override
  Future<List<CarModel>> getCarsNoPagination() async =>
      await carRemoteDataSource.getCarsNoPagination();

  @override
  Future<List<DictionaryModel>> getCarBrands({
    DictionaryModel? selectedCarType,
    DictionaryModel? selectedCarSubtype,
  }) async =>
      await carRemoteDataSource.getCarBrands(
        selectedCarType: selectedCarType,
        selectedCarSubtype: selectedCarSubtype,
      );

  @override
  Future<List<DictionaryModel>> getCarModels({
    required DictionaryModel selectedCarBrand,
  }) async =>
      await carRemoteDataSource.getCarModels(
        selectedCarBrand: selectedCarBrand,
      );

  @override
  Future<List<DictionaryModel>> getCarSubtypes({
    required DictionaryModel selectedCarType,
  }) async =>
      await carRemoteDataSource.getCarSubtypes(
        selectedCarType: selectedCarType,
      );

  @override
  Future<List<DictionaryModel>> getCarTypes() async =>
      await carRemoteDataSource.getCarTypes();
}

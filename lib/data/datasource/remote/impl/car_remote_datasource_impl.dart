import 'package:mtbek_front/core/shared/http.dart';
import 'package:mtbek_front/data/datasource/remote/abstract/car_remote_datasource.dart';
import 'package:mtbek_front/data/model/car/cars_paginated_response_model.dart';
import 'package:mtbek_front/domain/model/car_model.dart';
import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CarRemoteDataSource)
class CarRemoteDataSourceImpl implements CarRemoteDataSource {
  final Http http;
  const CarRemoteDataSourceImpl({
    required this.http,
  });

  @override
  Future<CarsPaginatedResponseModel> getUserCars({
    required int page,
    String? query,
    int? creationYear,
  }) async {
    try {
      final response = CarsPaginatedResponseModel.fromJson(
        await http.get(
          'api/v1/cars',
        ),
      );

      return response;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<List<CarModel>> getCarsNoPagination() async {
    try {
      final response = await http.get('api/v1/cars/all');

      return List<CarModel>.from(
        response["data"].map(
          (x) => CarModel.fromJson(x),
        ),
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<List<DictionaryModel>> getCarBrands({
    DictionaryModel? selectedCarType,
    DictionaryModel? selectedCarSubtype,
  }) async {
    try {
      final response = await http.get(
        'api/v1/cars/brands',
      );

      return List<DictionaryModel>.from(
        response.map(
          (x) => DictionaryModel.fromJson(x),
        ),
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<List<DictionaryModel>> getCarModels({
    required DictionaryModel selectedCarBrand,
  }) async {
    try {
      final response = await http.get(
        'api/v1/cars/models',
      );

      return List<DictionaryModel>.from(
        response.map(
          (x) => DictionaryModel.fromJson(x),
        ),
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<List<DictionaryModel>> getCarSubtypes({
    required DictionaryModel selectedCarType,
  }) async {
    try {
      final response = await http.get(
        'api/v1/cars/subtypes',
      );

      return List<DictionaryModel>.from(
        response.map(
          (x) => DictionaryModel.fromJson(x),
        ),
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<List<DictionaryModel>> getCarTypes() async {
    try {
      final response = await http.get(
        'api/v1/cars/types',
      );

      return List<DictionaryModel>.from(
        response.map(
          (x) => DictionaryModel.fromJson(x),
        ),
      );
    } catch (err) {
      rethrow;
    }
  }
}

import 'package:mtbek_front/data/model/car/cars_paginated_response_model.dart';
import 'package:mtbek_front/domain/model/car_model.dart';
import 'package:mtbek_front/domain/model/dictionaty_model.dart';

abstract class CarRemoteDataSource {
  Future<CarsPaginatedResponseModel> getUserCars({
    required int page,
    String? query,
    int? creationYear,
  });

  Future<List<CarModel>> getCarsNoPagination();

  Future<List<DictionaryModel>> getCarTypes();

  Future<List<DictionaryModel>> getCarSubtypes({
    required DictionaryModel selectedCarType,
  });

  Future<List<DictionaryModel>> getCarBrands({
    DictionaryModel? selectedCarType,
    DictionaryModel? selectedCarSubtype,
  });

  Future<List<DictionaryModel>> getCarModels({
    required DictionaryModel selectedCarBrand,
  });
}

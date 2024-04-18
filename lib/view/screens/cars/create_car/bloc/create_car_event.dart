part of 'create_car_bloc.dart';

sealed class CreateCarEvent extends Equatable {
  const CreateCarEvent();

  @override
  List<Object> get props => [];
}

final class CreateCarOpened extends CreateCarEvent {}

final class CreateCarBrandsRequested extends CreateCarEvent {
  final DictionaryModel? carType;
  final DictionaryModel? carSubtype;

  const CreateCarBrandsRequested({
    this.carType,
    this.carSubtype,
  });
}

final class CreateCarModelsRequested extends CreateCarEvent {
  final DictionaryModel carBrand;

  const CreateCarModelsRequested({
    required this.carBrand,
  });
}

final class CreateCarSubtypesRequested extends CreateCarEvent {
  final DictionaryModel carType;

  const CreateCarSubtypesRequested({
    required this.carType,
  });
}

final class CreateCarButtonPressed extends CreateCarEvent {
  final DictionaryModel? selectedCarType;
  final DictionaryModel? selectedCarSubtype;

  final DictionaryModel? selectedBodyType;

  final DictionaryModel? selectedCarBrand;
  final DictionaryModel? selectedCarModel;

  final int? year;
  final String? vin;
  final String? number;
  final List<XFile>? images;

  const CreateCarButtonPressed({
    required this.selectedCarType,
    required this.selectedCarBrand,
    required this.selectedCarModel,
    required this.year,
    required this.vin,
    required this.number,
    required this.images,
    this.selectedCarSubtype,
    this.selectedBodyType,
  });
}

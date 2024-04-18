import 'package:mtbek_front/domain/model/car_model.dart';
import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/domain/model/region_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateOrderInherited extends InheritedWidget {
  const CreateOrderInherited({
    super.key,
    required super.child,
    required this.selectedRegion,
    required this.regions,
    required this.isAddressError,
    required this.addressContoller,
    required this.selectedOrderType,
    required this.requestTypes,
    required this.selectedCar,
    required this.isTowTruckRequested,
    required this.problemContoller,
    required this.isProblemError,
    required this.images,
    required this.onImageAdd,
    required this.onImageRemove,
    required this.towTruckSwitchPressed,
    required this.onOrderTypeSelect,
    required this.onRegionSelect,
    required this.onCarSelect,
    required this.cars,
  });

  final RegionModel? selectedRegion;
  final List<RegionModel> regions;

  final bool isAddressError;
  final TextEditingController addressContoller;

  final DictionaryModel? selectedOrderType;
  final List<DictionaryModel> requestTypes;

  final CarModel? selectedCar;
  final List<CarModel> cars;

  final bool isTowTruckRequested;

  final TextEditingController problemContoller;
  final bool isProblemError;

  final List<XFile> images;

  final Function(XFile) onImageAdd;
  final Function(XFile) onImageRemove;
  final Function() towTruckSwitchPressed;
  final Function(DictionaryModel) onOrderTypeSelect;
  final Function(RegionModel) onRegionSelect;
  final Function(CarModel) onCarSelect;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static CreateOrderInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CreateOrderInherited>()!;
  }
}

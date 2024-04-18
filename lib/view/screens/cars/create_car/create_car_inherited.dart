import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateCarInherited extends InheritedWidget {
  final DictionaryModel? selectedCarType;
  final DictionaryModel? selectedCarSubtype;
  final DictionaryModel? selectedCarBrand;
  final DictionaryModel? selectedCarModel;

  final DictionaryModel? selectedBodyType;

  final TextEditingController yearController;
  final TextEditingController vinController;
  final TextEditingController numberController;

  final List<XFile>? images;

  final Function(DictionaryModel?) onCarTypeSelect;
  final Function(DictionaryModel?) onCarSubtypeSelect;
  final Function(DictionaryModel?) onCarBrandSelect;
  final Function(DictionaryModel?) onCarModelSelect;
  final Function(DictionaryModel?) onBodyTypeSelect;
  final Function(XFile) onImageRemove;
  final Function(XFile) onImageAdd;

  const CreateCarInherited({
    super.key,
    required super.child,
    this.selectedCarType,
    this.selectedCarSubtype,
    this.selectedBodyType,
    this.selectedCarBrand,
    this.selectedCarModel,
    this.images,
    required this.yearController,
    required this.onBodyTypeSelect,
    required this.vinController,
    required this.numberController,
    required this.onCarBrandSelect,
    required this.onCarModelSelect,
    required this.onCarSubtypeSelect,
    required this.onCarTypeSelect,
    required this.onImageAdd,
    required this.onImageRemove,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static CreateCarInherited of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CreateCarInherited>())!;
  }
}

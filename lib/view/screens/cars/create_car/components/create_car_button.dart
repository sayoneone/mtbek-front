import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/screens/cars/create_car/bloc/create_car_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateCarButton extends StatefulWidget {
  const CreateCarButton({
    super.key,
    required this.images,
    required this.number,
    required this.selectedCarBrand,
    required this.selectedCarModel,
    required this.selectedCarSubtype,
    required this.selectedCarType,
    required this.selectedBodyType,
    required this.vin,
    required this.year,
    this.borderRadius,
  });

  final DictionaryModel? selectedCarType;
  final DictionaryModel? selectedCarSubtype;

  final DictionaryModel? selectedBodyType;

  final DictionaryModel? selectedCarBrand;
  final DictionaryModel? selectedCarModel;

  final int? year;
  final String? vin;
  final String? number;
  final List<XFile>? images;

  final int? borderRadius;

  @override
  State<CreateCarButton> createState() => _CreateCarButtonState();
}

class _CreateCarButtonState extends State<CreateCarButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius == null
              ? null
              : BorderRadius.circular(widget.borderRadius!.toDouble()),
          color: Theme.of(context).primaryColor,
        ),
        child: const Text(
          'Добавить машину',
          style: TextStyle(
            color: DefaultColors.white,
          ),
        ),
      ),
      onTap: () {
        getIt<CreateCarBloc>().add(
          CreateCarButtonPressed(
            images: widget.images,
            number: widget.number,
            selectedCarBrand: widget.selectedCarBrand,
            selectedCarModel: widget.selectedCarModel,
            selectedCarSubtype: widget.selectedCarSubtype,
            selectedCarType: widget.selectedCarType,
            selectedBodyType: widget.selectedBodyType,
            vin: widget.vin,
            year: widget.year,
          ),
        );
      },
    );
  }
}

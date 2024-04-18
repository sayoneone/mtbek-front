import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/domain/model/car_model.dart';
import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/domain/model/region_model.dart';
import 'package:mtbek_front/view/common/default_colors.dart';

import 'package:mtbek_front/view/screens/orders/create_order/bloc/create_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateOrderButton extends StatefulWidget {
  const CreateOrderButton({
    super.key,
    required this.selectedRegion,
    required this.address,
    required this.selectedOrderType,
    required this.problem,
    required this.selectedCar,
    required this.isTowTruckRequested,
    required this.images,
    this.borderRadius,
  });

  final RegionModel? selectedRegion;
  final String address;
  final DictionaryModel? selectedOrderType;
  final CarModel? selectedCar;
  final String problem;
  final bool isTowTruckRequested;
  final List<XFile>? images;
  final int? borderRadius;

  @override
  State<CreateOrderButton> createState() => _CreateOrderButtonState();
}

class _CreateOrderButtonState extends State<CreateOrderButton> {
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
          'Отправить заявку',
          style: TextStyle(
            color: DefaultColors.white,
          ),
        ),
      ),
      onTap: () {
        getIt<CreateOrderBloc>().add(
          CreateOrderButtonPressed(
            selectedCar: widget.selectedCar,
            selectedRegion: widget.selectedRegion,
            address: widget.address,
            selectedOrderType: widget.selectedOrderType,
            problem: widget.problem,
            isTowTruckRequested: widget.isTowTruckRequested,
            images: widget.images,
          ),
        );
      },
    );
  }
}

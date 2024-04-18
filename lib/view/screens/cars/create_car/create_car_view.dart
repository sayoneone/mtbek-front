import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/view/common/default_error_view.dart';
import 'package:mtbek_front/view/responsive/responsive_layout_handler.dart';
import 'package:mtbek_front/view/screens/cars/create_car/bloc/create_car_bloc.dart';
import 'package:mtbek_front/view/screens/cars/create_car/create_car_inherited.dart';
import 'package:mtbek_front/view/screens/cars/create_car/layout/desktop/create_car_desktop_view.dart';
import 'package:mtbek_front/view/screens/cars/create_car/layout/mobile/create_car_mobile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:image_picker/image_picker.dart';

class CreateCarView extends StatefulWidget {
  const CreateCarView({super.key});

  @override
  State<CreateCarView> createState() => _CreateCarViewState();
}

class _CreateCarViewState extends State<CreateCarView> {
  final yearController = TextEditingController();
  final vinController = TextEditingController();
  final numberController = TextEditingController();


  DictionaryModel? selectedCarType;
  DictionaryModel? selectedCarSubtype;
  DictionaryModel? selectedCarBrand;
  DictionaryModel? selectedCarModel;
  DictionaryModel? selectedBodyType;

  List<XFile> images = [];

  @override
  void initState() {
    // getIt<CreateCarBloc>().add(CreateCarOpened());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CreateCarBloc>(),
      child: BlocConsumer<CreateCarBloc, CreateCarState>(
        listener: (context, state) {
          if (state is CreateCarFailure) {
            DefaultErrorView.call(message: state.message);
          }
        },
        builder: (context, state) {
          return KeyboardDismissOnTap(
            child: CreateCarInherited(
              onImageAdd: (v) => setState(() => images.add(v)),
              onImageRemove: (v) => setState(() => images.remove(v)),
              onCarTypeSelect: (v) => setState(() => selectedCarType = v),
              onCarBrandSelect: (v) => setState(() => selectedCarBrand = v),
              onCarModelSelect: (v) => setState(() => selectedCarModel = v),
              onCarSubtypeSelect: (v) => setState(() => selectedCarSubtype = v),
              selectedBodyType: selectedBodyType,
              onBodyTypeSelect: (v) => setState(() => selectedBodyType = v),
              yearController: yearController,
              vinController: vinController,
              numberController: numberController,
              images: images,
              selectedCarBrand: selectedCarBrand,
              selectedCarModel: selectedCarModel,
              selectedCarType: selectedCarType,
              selectedCarSubtype: selectedCarSubtype,
              child: const ResponsiveLayoutHandler(
                mobileView: CreateCarMobileView(),
                desktopView: CreateCarDesktopView(),
              ),
            ),
          );
        },
      ),
    );
  }
}

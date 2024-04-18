import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/domain/model/car_model.dart';
import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/domain/model/region_model.dart';
import 'package:mtbek_front/view/common/default_error_view.dart';
import 'package:mtbek_front/view/responsive/responsive_layout_handler.dart';
import 'package:mtbek_front/view/screens/orders/create_order/bloc/create_order_bloc.dart';
import 'package:mtbek_front/view/screens/orders/create_order/create_order_inherited.dart';
import 'package:mtbek_front/view/screens/orders/create_order/layout/desktop/create_order_desktop_view.dart';
import 'package:mtbek_front/view/screens/orders/create_order/layout/mobile/create_order_mobile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:image_picker/image_picker.dart';

class CreateOrderView extends StatefulWidget {
  const CreateOrderView({super.key});

  @override
  State<CreateOrderView> createState() => _CreateOrderViewState();
}

class _CreateOrderViewState extends State<CreateOrderView> {
  RegionModel? selectedRegion;
  List<RegionModel> regions = [];

  bool isAddressError = false;
  TextEditingController addressContoller = TextEditingController();

  DictionaryModel? selectedOrderType;
  List<DictionaryModel> requestTypes = [];

  CarModel? selectedCar;
  List<CarModel> cars = [];

  bool isTowTruckRequested = false;

  TextEditingController problemContoller = TextEditingController();
  bool isProblemError = false;

  List<XFile> images = [];

  @override
  void initState() {
    super.initState();
    getIt<CreateOrderBloc>().add(RegionsRequested());
    getIt<CreateOrderBloc>().add(OrderTypesRequested());
    getIt<CreateOrderBloc>().add(UserCarsRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CreateOrderBloc>(),
      child: BlocConsumer<CreateOrderBloc, CreateOrderState>(
        listener: (context, state) {
          if (state is CreateOrderFailure) {
            DefaultErrorView.call(
              message: state.message,
            );
          } else if (state is CarsLoaded) {
            cars = state.cars ?? [];
          }
          if (state is CreateRequestSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is RegionsLoaded) {
            regions = state.regions ?? [];
          } else if (state is OrderTypesLoaded) {
            requestTypes = state.requestTypes ?? [];
          }
          return KeyboardDismissOnTap(
            child: CreateOrderInherited(
              cars: cars,
              problemContoller: problemContoller,
              isAddressError: isAddressError,
              isProblemError: isProblemError,
              requestTypes: requestTypes,
              regions: regions,
              selectedRegion: selectedRegion,
              addressContoller: addressContoller,
              selectedOrderType: selectedOrderType,
              selectedCar: selectedCar,
              isTowTruckRequested: isTowTruckRequested,
              images: images,
              onImageRemove: (v) => setState(() => images.remove(v)),
              onImageAdd: (v) => setState(() => images.add(v)),
              towTruckSwitchPressed: () =>
                  setState(() => isTowTruckRequested = !isTowTruckRequested),
              onCarSelect: (v) => setState(() => selectedCar = v),
              onRegionSelect: (v) => setState(() => selectedRegion = v),
              onOrderTypeSelect: (v) => setState(() => selectedOrderType = v),
              child: const ResponsiveLayoutHandler(
                mobileView: CreateOrderMobileView(),
                desktopView: CreateOrderDesktopView(),
              ),
            ),
          );
        },
      ),
    );
  }
}

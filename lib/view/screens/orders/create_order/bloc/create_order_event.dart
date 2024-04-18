part of 'create_order_bloc.dart';

sealed class CreateOrderEvent extends Equatable {
  const CreateOrderEvent();

  @override
  List<Object> get props => [];
}

class RegionsRequested extends CreateOrderEvent {}

class OrderTypesRequested extends CreateOrderEvent {}

class UserCarsRequested extends CreateOrderEvent {}

class CreateOrderButtonPressed extends CreateOrderEvent {
  final String problem;
  final RegionModel? selectedRegion;
  final String address;
  final DictionaryModel? selectedOrderType;
  final CarModel? selectedCar;
  final bool isTowTruckRequested;
  final List<XFile>? images;

  const CreateOrderButtonPressed({
    required this.problem,
    required this.address,
    required this.selectedRegion,
    required this.selectedOrderType,
    required this.selectedCar,
    required this.isTowTruckRequested,
    required this.images,
  });
}

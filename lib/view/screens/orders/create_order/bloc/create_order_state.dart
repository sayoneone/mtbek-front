part of 'create_order_bloc.dart';

sealed class CreateOrderState extends Equatable {
  const CreateOrderState();

  @override
  List<Object> get props => [];
}

final class CreateOrderInitial extends CreateOrderState {}

final class CreateOrderLoading extends CreateOrderState {}

final class CreateRequestSuccess extends CreateOrderState {}

final class CreateOrderFailure extends CreateOrderState {
  final String message;

  const CreateOrderFailure({
    required this.message,
  });
}

final class RegionsLoaded extends CreateOrderState {
  final List<RegionModel>? regions;

  const RegionsLoaded({
    required this.regions,
  });
}

final class OrderTypesLoaded extends CreateOrderState {
  final List<DictionaryModel>? requestTypes;

  const OrderTypesLoaded({
    required this.requestTypes,
  });
}

final class CarsLoaded extends CreateOrderState {
  final List<CarModel>? cars;

  const CarsLoaded({
    required this.cars,
  });
}

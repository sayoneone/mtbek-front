part of 'my_orders_bloc.dart';

sealed class MyOrdersState extends Equatable {
  const MyOrdersState();

  @override
  List<Object> get props => [];
}

final class MyOrderInitial extends MyOrdersState {}

final class MyOrderLoading extends MyOrdersState {}

final class MyOrderPageLoading extends MyOrdersState {}

final class MyOrderFailure extends MyOrdersState {
  final String message;

  const MyOrderFailure({
    required this.message,
  });
}

final class MyOrdersLoaded extends MyOrdersState {
  final List<OrderModel> orders;
  final int? currentPage;
  final int? lastPage;
  const MyOrdersLoaded({
    required this.orders,
    required this.currentPage,
    required this.lastPage,
  });
}

final class OrderTypesGotState extends MyOrdersState {
  final List<DictionaryModel>? orderTypes;

  const OrderTypesGotState({
    required this.orderTypes,
  });
}

part of 'my_orders_bloc.dart';

sealed class MyOrdersEvent extends Equatable {
  const MyOrdersEvent();

  @override
  List<Object> get props => [];
}

class MyOrderOpened extends MyOrdersEvent {}

class GetMyOrderTypesEvent extends MyOrdersEvent {}

class GetMyOrdersEvent extends MyOrdersEvent {}

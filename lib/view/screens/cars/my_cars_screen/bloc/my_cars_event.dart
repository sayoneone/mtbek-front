part of 'my_cars_bloc.dart';

sealed class MyCarsEvent extends Equatable {
  const MyCarsEvent();

  @override
  List<Object> get props => [];
}

class MyCarsOpened extends MyCarsEvent {
  const MyCarsOpened();
}
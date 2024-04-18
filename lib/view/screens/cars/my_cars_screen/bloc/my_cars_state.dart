part of 'my_cars_bloc.dart';

sealed class MyCarsState extends Equatable {
  const MyCarsState();

  @override
  List<Object> get props => [];
}

final class MyCarsInitial extends MyCarsState {}

final class MyCarsLoading extends MyCarsState {}

final class MyCarsFailure extends MyCarsState {
  final String message;

  const MyCarsFailure({
    required this.message,
  });
}

part of 'registration_bloc.dart';

sealed class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

final class RegistrationInitial extends RegistrationState {}

final class RegistrationLoading extends RegistrationState {}

final class RegistrationSuccess extends RegistrationState {}

final class RegistrationFailure extends RegistrationState {
  final String message;

  const RegistrationFailure({
    required this.message,
  });
}

final class RegionsLoaded extends RegistrationState {
  const RegionsLoaded();
}

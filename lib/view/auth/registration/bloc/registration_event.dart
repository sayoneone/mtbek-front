part of 'registration_bloc.dart';

sealed class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationRequested extends RegistrationEvent {
  final String? companyName;
  final String name;
  final String email;
  final String phone;
  final String password;
  final RegionModel region;
  final bool isBusiness;

  const RegistrationRequested({
    required this.companyName,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.region,
    required this.isBusiness,
  });
}

class RegionsRequested extends RegistrationEvent {}

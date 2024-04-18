part of 'create_car_bloc.dart';

sealed class CreateCarState extends Equatable {
  const CreateCarState();

  @override
  List<Object> get props => [];
}

final class CreateCarInitial extends CreateCarState {}

final class CreateCarFailure extends CreateCarState {
  final String message;

  const CreateCarFailure({
    required this.message,
  });
}

final class CreateCarLoading extends CreateCarState {}

final class CreateCarTypesLoaded extends CreateCarState {
  const CreateCarTypesLoaded();
}

final class CreateCarSubtypesLoaded extends CreateCarState {
  const CreateCarSubtypesLoaded();
}

final class CreateCarBrandsLoaded extends CreateCarState {
  const CreateCarBrandsLoaded();
}

final class CreateCarModelsLoaded extends CreateCarState {
  const CreateCarModelsLoaded();
}

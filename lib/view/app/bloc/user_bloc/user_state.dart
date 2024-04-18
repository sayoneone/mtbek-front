part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserLoaded extends UserState {
  const UserLoaded();
}

final class UserFailure extends UserState {
  final String message;

  const UserFailure({
    required this.message,
  });
}

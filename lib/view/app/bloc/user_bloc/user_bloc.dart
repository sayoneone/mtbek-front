import 'package:bloc/bloc.dart';
import 'package:mtbek_front/core/utils/exceptions.dart';
import 'package:mtbek_front/domain/model/user_model.dart';
import 'package:mtbek_front/domain/usecase/auth/get_user_usecase.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'user_event.dart';
part 'user_state.dart';

@singleton
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase getUserUseCase;
  UserModel? user;

  UserBloc({
    required this.getUserUseCase,
  }) : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      try {
        if (event is CurrentUserRequested) {
          emit(UserLoading());
          user = await getUserUseCase(NoParams());

          emit( const UserLoaded());
        }
      } on BaseException catch (err) {
        emit(
          UserFailure(
            message: err.getMessage(),
          ),
        );
      } catch (err) {
        emit(
          UserFailure(
            message: err.toString(),
          ),
        );
      }
    });
  }
}

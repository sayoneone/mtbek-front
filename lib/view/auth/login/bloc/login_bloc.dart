import 'package:bloc/bloc.dart';
import 'package:mtbek_front/core/utils/exceptions.dart';
import 'package:mtbek_front/domain/model/user_model.dart';
import 'package:mtbek_front/view/app/bloc/auth_bloc/auth_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/injection/configurator.dart';
import '../../../../domain/usecase/auth/post_login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

@singleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final PostLoginUseCase postLoginUseCase;
  LoginBloc({
    required this.postLoginUseCase,
  }) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      try {
        if (event is LoginRequested) {
          emit(LoginLoading());
          final response = await postLoginUseCase(
            PostLoginUseCaseParams(
              userData: UserModel(
                login: event.username,
                password: event.password,
              ),
            ),
          );

          getIt<AuthBloc>().add(
            LoggedIn(
              token: response,
            ),
          );
          emit(LoginSuccess());
        }
      } on BaseException catch (e) {
        emit(
          LoginFailure(
            message: e.getMessage(),
          ),
        );
      } catch (e) {
        emit(
          LoginFailure(
            message: e.toString(),
          ),
        );
      }
    });
  }
}

// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:mtbek_front/core/utils/exceptions.dart';

import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:mtbek_front/domain/usecase/shared_preferences/if_token_exists_usecase.dart';
import 'package:mtbek_front/domain/usecase/shared_preferences/remove_token_usecase.dart';
import 'package:mtbek_front/domain/usecase/shared_preferences/save_token_usecase.dart';

import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:mtbek_front/view/utils/bloc_extension.dart';
import 'package:is_first_run/is_first_run.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IfTokenExistsUseCase ifTokenExistsUseCase;
  final SaveTokenUseCase saveTokenUseCase;
  final RemoveTokenUseCase removeTokenUseCase;

  AuthBloc({
    required this.ifTokenExistsUseCase,
    required this.saveTokenUseCase,
    required this.removeTokenUseCase,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      try {
        if (event is AppStarted) {
          if (await ifTokenExistsUseCase(NoParams())) {
            emit(Authorized());
          } else {
            emit(
              Unauthorized(
                isFirstRun: await IsFirstRun.isFirstRun(),
              ),
            );
          }
        } else if (event is LoggedIn) {
          await saveTokenUseCase(SaveTokenUseCaseParams(token: event.token));

          emit(Authorized());
        } else if (event is LoggedOut) {
          await removeTokenUseCase(NoParams());

          emit(
            Unauthorized(
              isFirstRun: await IsFirstRun.isFirstRun(),
            ),
          );
        }
      } on BaseException catch (err) {
        emitOneShot(AuthFailure(message: err.getMessage()));
      } catch (err) {
        emitOneShot(AuthFailure(message: err.toString()));
      }
    });
  }
}

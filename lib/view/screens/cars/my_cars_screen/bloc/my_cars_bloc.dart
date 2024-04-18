import 'package:bloc/bloc.dart';
import 'package:mtbek_front/core/utils/exceptions.dart';
import 'package:mtbek_front/domain/usecase/car/get_user_cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'my_cars_event.dart';
part 'my_cars_state.dart';

@singleton
class MyCarsBloc extends Bloc<MyCarsEvent, MyCarsState> {
  final GetUserCarsUseCase getUserCarsUseCase;

  int page = 0;
  int? year;
  String? searchQuery = '';

  int visibleItemsCount = 10;


  MyCarsBloc({
    required this.getUserCarsUseCase,
  }) : super(MyCarsInitial()) {
    on<MyCarsEvent>((event, emit) {
      try {
        if (event is MyCarsOpened) {
          emit(MyCarsLoading());
          emit(MyCarsInitial());
        }
      } on BaseException catch (err) {
        emit(
          MyCarsFailure(
            message: err.getMessage(),
          ),
        );
      } catch (err) {
        emit(
          MyCarsFailure(
            message: err.toString(),
          ),
        );
      }
    });
  }
}

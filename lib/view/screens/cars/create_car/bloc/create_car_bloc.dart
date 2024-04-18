import 'package:bloc/bloc.dart';
import 'package:mtbek_front/core/utils/exceptions.dart';
import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:mtbek_front/domain/usecase/car/get_car_brands_usecase.dart';
import 'package:mtbek_front/domain/usecase/car/get_car_models_usecase.dart';
import 'package:mtbek_front/domain/usecase/car/get_car_subtypes_usecase.dart';
import 'package:mtbek_front/domain/usecase/car/get_car_types_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'create_car_event.dart';
part 'create_car_state.dart';

@singleton
class CreateCarBloc extends Bloc<CreateCarEvent, CreateCarState> {
  final GetCarTypesUseCase getCarTypesUseCase;
  final GetCarSubtypesUseCase getCarSubtypesUseCase;
  final GetCarBrandsUseCase getCarBrandsUseCase;
  final GetCarModelsUseCase getCarModelsUseCase;

  List<DictionaryModel>? carTypes;
  List<DictionaryModel>? carSubtypes;
  List<DictionaryModel>? carBrands;
  List<DictionaryModel>? carModels;

  CreateCarBloc({
    required this.getCarTypesUseCase,
    required this.getCarSubtypesUseCase,
    required this.getCarBrandsUseCase,
    required this.getCarModelsUseCase,
  }) : super(CreateCarInitial()) {
    on<CreateCarEvent>((event, emit) async {
      try {
        if (event is CreateCarOpened) {
          emit(CreateCarLoading());

          carTypes = await getCarTypesUseCase(NoParams());

          emit(const CreateCarTypesLoaded());
        } else if (event is CreateCarBrandsRequested) {
          emit(CreateCarLoading());

          carBrands = await getCarBrandsUseCase(
            GetCarBrandsUseCaseParams(
              selectedCarType: event.carType,
              selectedCarSubtype: event.carSubtype,
            ),
          );

          emit(const CreateCarBrandsLoaded());
        } else if (event is CreateCarModelsRequested) {
          emit(CreateCarLoading());

          carModels = await getCarModelsUseCase(GetCarModelsUseCaseParams(
            selectedCarBrand: event.carBrand,
          ));

          emit(const CreateCarModelsLoaded());
        } else if (event is CreateCarSubtypesRequested) {
          emit(CreateCarLoading());

          carSubtypes = await getCarSubtypesUseCase(GetCarSubtypesUseCaseParams(
            selectedCarType: event.carType,
          ));

          emit(const CreateCarSubtypesLoaded());
        }
      } on BaseException catch (err) {
        emit(
          CreateCarFailure(
            message: err.getMessage(),
          ),
        );
      } catch (err) {
        emit(
          CreateCarFailure(
            message: err.toString(),
          ),
        );
      }
    });
  }
}

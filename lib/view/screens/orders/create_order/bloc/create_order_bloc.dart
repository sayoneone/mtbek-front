import 'package:bloc/bloc.dart';
import 'package:mtbek_front/core/utils/exceptions.dart';
import 'package:mtbek_front/data/request_model/order_request.dart';
import 'package:mtbek_front/domain/model/car_model.dart';
import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/domain/model/region_model.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:mtbek_front/domain/usecase/car/get_user_cars_usecase.dart';
import 'package:mtbek_front/domain/usecase/client/get_regions_usecase.dart';
import 'package:mtbek_front/domain/usecase/order/get_order_types_usecase.dart';
import 'package:mtbek_front/domain/usecase/order/post_create_order_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'create_order_event.dart';
part 'create_order_state.dart';

@singleton
class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  final GetRegionsUseCase getRegionsUseCase;
  final GetOrderTypesUseCase getOrderTypesUseCase;
  final GetUserCarsUseCase getUserCarsUseCase;
  final PostCreateOrderUseCase postCreateOrderUseCase;

  CreateOrderBloc({
    required this.getRegionsUseCase,
    required this.getUserCarsUseCase,
    required this.getOrderTypesUseCase,
    required this.postCreateOrderUseCase,
  }) : super(CreateOrderInitial()) {
    on<CreateOrderEvent>((event, emit) async {
      try {
        if (event is RegionsRequested) {
          emit(CreateOrderLoading());

          final response = await getRegionsUseCase(NoParams());

          emit(RegionsLoaded(regions: response));
        } else if (event is OrderTypesRequested) {
          emit(CreateOrderLoading());

          final response = await getOrderTypesUseCase(NoParams());

          emit(OrderTypesLoaded(requestTypes: response));
        } else if (event is UserCarsRequested) {
          emit(CreateOrderLoading());

          final response = await getUserCarsUseCase(NoParams());

          emit(CarsLoaded(cars: response));
        } else if (event is CreateOrderButtonPressed) {
          emit(CreateOrderLoading());
          final response = await postCreateOrderUseCase(
            PostCreateOrderUseCaseParams(
              request: OrderRequest(
                carId: event.selectedCar?.id,
                type: event.selectedOrderType?.id,
                regionId: event.selectedRegion?.id,
                districtId: event.selectedRegion?.parentId,
                description: event.problem,
                images: event.images?.map((e) => e.path).toList(),
                isEvacuated: event.isTowTruckRequested,
              ),
            ),
          );
          emit(CreateRequestSuccess());

          // emit(CarsLoaded(cars: response.));
        }
      } on BaseException catch (err) {
        emit(
          CreateOrderFailure(
            message: err.getMessage(),
          ),
        );
      } catch (err) {
        emit(
          CreateOrderFailure(
            message: err.toString(),
          ),
        );
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:mtbek_front/core/utils/exceptions.dart';
import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/domain/model/order_model.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:mtbek_front/domain/usecase/order/get_order_types_usecase.dart';
import 'package:mtbek_front/domain/usecase/order/get_user_orders_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'my_orders_event.dart';
part 'my_orders_state.dart';

@singleton
class MyOrdersBloc extends Bloc<MyOrdersEvent, MyOrdersState> {
  final GetOrderTypesUseCase getOrderTypesUseCase;
  final GetUserOrdersUseCase getUserOrdersUseCase;
  int? page;
  int? lastPage;
  DateTime? startDate;
  DateTime? endDate;
  DictionaryModel? selectedStatus;
  String searchQuery = '';

  List<DictionaryModel>? orderTypes;

  int visibleItemsCount = 10;

  MyOrdersBloc({
    required this.getUserOrdersUseCase,
    required this.getOrderTypesUseCase,
  }) : super(MyOrderInitial()) {
    on<MyOrdersEvent>((event, emit) async {
      try {
        if (event is MyOrderOpened) {
          emit(MyOrderLoading());
          final pagination =
              await getUserOrdersUseCase(GetUserOrdersUseCaseParams(
            startDate: startDate,
            endDate: endDate,
            searchQuery: searchQuery.isEmpty ? null : searchQuery,
            status: selectedStatus,
          ));
          page = pagination?.currentPage;
          lastPage = pagination?.lastPage;
          emit(
            MyOrdersLoaded(
              orders: pagination?.data ?? [],
              currentPage: pagination?.currentPage,
              lastPage: pagination?.lastPage,
            ),
          );
        } else if (event is GetMyOrderTypesEvent) {
          emit(MyOrderLoading());
          final orderTypes = await getOrderTypesUseCase(NoParams());

          emit(OrderTypesGotState(
            orderTypes: orderTypes,
          ));
        } else if (event is GetMyOrdersEvent) {
          if (state is MyOrderPageLoading) {
            return;
          }
          if (page != lastPage) {
            emit(MyOrderPageLoading());

            final pagination = await getUserOrdersUseCase(
              GetUserOrdersUseCaseParams(
                page: page == null ? null : page! + 1,
                startDate: startDate,
                endDate: endDate,
                searchQuery: searchQuery.isEmpty ? null : searchQuery,
                status: selectedStatus,
              ),
            );
            page = pagination?.currentPage;
            lastPage = pagination?.lastPage;
            emit(
              MyOrdersLoaded(
                orders: pagination?.data ?? [],
                currentPage: pagination?.currentPage,
                lastPage: pagination?.lastPage,
              ),
            );
          }
        }
      } on BaseException catch (err) {
        emit(
          MyOrderFailure(
            message: err.getMessage(),
          ),
        );
      } catch (err) {
        emit(
          MyOrderFailure(
            message: err.toString(),
          ),
        );
      }
    });
  }
}

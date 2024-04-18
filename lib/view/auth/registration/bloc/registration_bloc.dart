import 'package:bloc/bloc.dart';
import 'package:mtbek_front/core/utils/exceptions.dart';
import 'package:mtbek_front/domain/model/region_model.dart';
import 'package:mtbek_front/domain/usecase/auth/post_registration_usecase.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:mtbek_front/domain/usecase/client/get_regions_usecase.dart';
import 'package:mtbek_front/view/app/bloc/auth_bloc/auth_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'registration_event.dart';
part 'registration_state.dart';

@singleton
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final PostRegistrationUseCase postRegistrationUseCase;
  final GetRegionsUseCase getRegionsUseCase;
  final AuthBloc authBloc;

  List<RegionModel>? regions;
  RegistrationBloc({
    required this.postRegistrationUseCase,
    required this.getRegionsUseCase,
    required this.authBloc,
  }) : super(RegistrationInitial()) {
    on<RegistrationEvent>(
      (event, emit) async {
        try {
          if (event is RegistrationRequested) {
            emit(RegistrationLoading());
            final response = await postRegistrationUseCase(
              PostRegistrationUseCaseParams(
                companyName: event.companyName,
                name: event.name,
                email: event.email,
                phone: event.phone,
                password: event.password,
                regionId: event.region.id ?? 0,
                isBusiness: event.isBusiness,
              ),
            );

            authBloc.add(
              LoggedIn(token: response),
            );
            emit(RegistrationSuccess());
          } else if (event is RegionsRequested) {
            emit(RegistrationLoading());
            regions = await getRegionsUseCase(NoParams());
            emit(const RegionsLoaded());
          }
        } on BaseException catch (err) {
          emit(
            RegistrationFailure(
              message: err.getMessage(),
            ),
          );
        } catch (err) {
          emit(
            RegistrationFailure(
              message: err.toString(),
            ),
          );
        }
      },
    );
  }
}

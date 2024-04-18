import 'package:mtbek_front/domain/model/user_model.dart';
import 'package:mtbek_front/domain/repository/client_repository.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserUseCase implements UseCase<UserModel, NoParams> {
  final ClientRepository repository;

  GetUserUseCase({
    required this.repository,
  });

  @override
  Future<UserModel> call(NoParams params) async => await repository.getUser();
}

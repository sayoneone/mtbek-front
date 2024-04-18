import 'package:mtbek_front/domain/model/user_model.dart';
import 'package:mtbek_front/domain/repository/client_repository.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

class PostRegistrationUseCaseParams {
  final String? companyName;
  final String name;
  final String email;
  final String phone;
  final String password;
  final int regionId;
  final bool isBusiness;

  const PostRegistrationUseCaseParams({
    required this.companyName,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.regionId,
    required this.isBusiness,
  });
}

@lazySingleton
class PostRegistrationUseCase
    implements UseCase<String, PostRegistrationUseCaseParams> {
  final ClientRepository repository;

  PostRegistrationUseCase({
    required this.repository,
  });

  @override
  Future<String> call(PostRegistrationUseCaseParams params) async =>
      await repository.registration(
        userData: UserModel(
          companyName: params.companyName,
          name: params.name,
          email: params.email,
          phone: params.phone,
          password: params.password,
          regionId: params.regionId,
          isBusiness: params.isBusiness,
        ),
      );
}

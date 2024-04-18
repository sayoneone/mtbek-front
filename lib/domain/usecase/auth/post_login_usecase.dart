import 'package:mtbek_front/domain/repository/client_repository.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../model/user_model.dart';

class PostLoginUseCaseParams {
  final UserModel userData;

  const PostLoginUseCaseParams({
    required this.userData,
  });
}

@lazySingleton
class PostLoginUseCase implements UseCase<String, PostLoginUseCaseParams> {
  final ClientRepository repository;

  PostLoginUseCase({
    required this.repository,
  });

  @override
  Future<String> call(PostLoginUseCaseParams params) async {
    return await repository.login(
      userData: params.userData,
    );
  }
}

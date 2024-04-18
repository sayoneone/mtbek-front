import 'package:mtbek_front/core/shared/cache.dart';
import 'package:mtbek_front/core/utils/cache_keys.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

class SaveTokenUseCaseParams {
  final String token;

  const SaveTokenUseCaseParams({
    required this.token,
  });
}

@lazySingleton
class SaveTokenUseCase implements UseCase<void, SaveTokenUseCaseParams> {
  final Cache cache;

  const SaveTokenUseCase({
    required this.cache,
  });

  @override
  Future<void> call(SaveTokenUseCaseParams params) async {
    return await cache.setString(CacheKeys.token, params.token);
  }
}

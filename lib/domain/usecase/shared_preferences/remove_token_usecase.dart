import 'package:mtbek_front/core/shared/cache.dart';
import 'package:mtbek_front/core/utils/cache_keys.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoveTokenUseCase implements UseCase<void, NoParams> {
  final Cache cache;

  const RemoveTokenUseCase({
    required this.cache,
  });

  @override
  Future<void> call(NoParams params) async {
    return await cache.remove(CacheKeys.token);
  }
}

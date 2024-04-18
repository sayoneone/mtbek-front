import 'package:mtbek_front/data/request_model/order_request.dart';
import 'package:mtbek_front/domain/repository/order_repostory.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

class PostCreateOrderUseCaseParams {
  final OrderRequest request;

  PostCreateOrderUseCaseParams({
    required this.request,
  });
}

@lazySingleton
class PostCreateOrderUseCase
    implements UseCase<void, PostCreateOrderUseCaseParams> {
  final OrderRepository repository;

  const PostCreateOrderUseCase({
    required this.repository,
  });

  @override
  Future<void> call(PostCreateOrderUseCaseParams params) async =>
      await repository.createOrder(request: params.request);
}

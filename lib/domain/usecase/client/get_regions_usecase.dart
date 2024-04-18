import 'package:mtbek_front/domain/model/region_model.dart';
import 'package:mtbek_front/domain/repository/client_repository.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetRegionsUseCase implements UseCase<List<RegionModel>?, NoParams> {
  final ClientRepository clientRepository;

  GetRegionsUseCase({
    required this.clientRepository,
  });
  @override
  Future<List<RegionModel>?> call(NoParams params) async =>
      (await clientRepository.getRegions()).data;
}

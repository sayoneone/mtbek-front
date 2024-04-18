import 'package:mtbek_front/core/shared/cache.dart';
import 'package:mtbek_front/data/datasource/local/client_local_datasource.dart';
import 'package:mtbek_front/data/datasource/remote/abstract/client_remote_datasource.dart';
import 'package:mtbek_front/domain/model/region_model.dart';
import 'package:mtbek_front/domain/model/user_model.dart';
import 'package:mtbek_front/domain/repository/client_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ClientRepository)
class ClientRepositoryImpl implements ClientRepository {
  final ClientRemoteDataSource clientRemoteDataSource;
  final ClientLocalDataSource clientLocalDataSource;
  final Cache cache;

  const ClientRepositoryImpl({
    required this.clientRemoteDataSource,
    required this.clientLocalDataSource,
    required this.cache,
  });

  @override
  Future<String> login({required UserModel userData}) async {
    return await clientRemoteDataSource.login(
      userData: userData,
    );
  }

  @override
  Future<RegionsResponseModel> getRegions() async {
    return await clientRemoteDataSource.getRegions();
  }

  @override
  Future<String> registration({required UserModel userData}) async =>
      await clientRemoteDataSource.registration(
        userData: userData,
      );

  @override
  Future<UserModel> getUser() async => await clientRemoteDataSource.getUser();
}

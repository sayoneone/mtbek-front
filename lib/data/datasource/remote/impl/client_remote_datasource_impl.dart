import 'package:mtbek_front/core/shared/http.dart';
import 'package:mtbek_front/data/datasource/remote/abstract/client_remote_datasource.dart';
import 'package:mtbek_front/domain/model/region_model.dart';
import 'package:mtbek_front/domain/model/user_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ClientRemoteDataSource)
class ClientRemoteDataSourceImpl implements ClientRemoteDataSource {
  final Http http;
  const ClientRemoteDataSourceImpl({
    required this.http,
  });

  @override
  Future<String> login({required UserModel userData}) async {
    try {
      final request = await http.post(
        'api/v1/auth/login',
        body: userData.toMap(),
      );

      return request["access_token"];
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<RegionsResponseModel> getRegions() async {
    try {
      return RegionsResponseModel.fromJson(
        (await http.get(
          'api/v1/regions/all',
        )),
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<String> registration({required UserModel userData}) async {
    try {
      return (await http.post(
        'api/v1/auth/register',
        body: userData.toMap(),
      ))['access_token'];
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getUser() async {
    try {
      final response = await http.get(
        'api/v1/auth/user',
      );
      return UserModel.fromMap(response["user"]);
    } catch (err) {
      rethrow;
    }
  }
}

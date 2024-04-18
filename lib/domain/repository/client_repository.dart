
import 'package:mtbek_front/domain/model/region_model.dart';
import 'package:mtbek_front/domain/model/user_model.dart';

abstract class ClientRepository {
  Future<String> login({required UserModel userData});
  Future<String> registration({required UserModel userData});
  Future<UserModel> getUser();
  Future<RegionsResponseModel> getRegions();
}

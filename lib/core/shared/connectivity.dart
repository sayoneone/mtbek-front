import 'package:connectivity_plus/connectivity_plus.dart';

class DefaultConnetivity {
  // Проверка интернет соединения
  Future<bool> isInternetHas() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }

    return false;
  }
}

import 'package:connectivity/connectivity.dart';

mixin ConnectivityChecker {
  Future<bool> isConnected() async {
    final connectivity = await (Connectivity()).checkConnectivity();
    return connectivity == ConnectivityResult.mobile ||
        connectivity == ConnectivityResult.wifi;
  }
}

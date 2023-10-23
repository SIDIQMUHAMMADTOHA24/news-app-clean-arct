import 'package:connectivity/connectivity.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl({required this.connectivity});
  @override
  Future<bool> get isConnected async {
    var result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_base_project/domain/providers/providers.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: NetworkProvider)
class NetworkProviderImpl extends NetworkProvider {
  late Connectivity connectivity;

  Stream<ConnectivityResult> get onConnectivityChanged => connectivity.onConnectivityChanged;

  NetworkProviderImpl() {
    connectivity = Connectivity();
  }

  @override
  Future<bool> get isConnected async {
    final connectivityResult = await (connectivity.checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}

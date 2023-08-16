import 'package:core_plugin_arch_poc/core/application/messageing_interface.dart';

abstract interface class SplashMessagingInterface
    extends BaseMessagingInterface {
  Future<bool> fetchConnectionState();

  void listenToConnectivity({
    required Function onConnected,
    required Function onDisconnected,
  });

  void unsubscribeFromConnectivity();

  Future<String?> fetchAuthToken();

  Future<bool> loginWithToken(String token);
}

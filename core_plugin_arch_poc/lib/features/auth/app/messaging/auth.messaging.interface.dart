import 'package:core_plugin_arch_poc/core/application/messageing_interface.dart';

abstract interface class AuthMessagingInterface extends BaseMessagingInterface {
  Future<String?> fetchToken();

  Future<void> saveToken(String token);

  void forgetToken();

  void sendLoggedInnMessage();

  void sendLoggedOutMessage();

  void listenToRPCMessages({
    required Future<bool> Function(String) onLoginRequested,
    required Function() onLogoutRequested,
    required Function() onForgetUserRequested,
  });
}

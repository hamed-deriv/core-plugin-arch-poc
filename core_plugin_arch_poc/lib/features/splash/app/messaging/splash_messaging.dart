import 'package:kafka_clone/shelf.dart';
import 'package:core_plugin_arch_poc/features/splash/app/messaging/splash_messaging.interface.dart';

final class SplashMessaging
    with ConsumerMixin, ProducerMixin
    implements SplashMessagingInterface {
  @override
  Future<bool> fetchConnectionState() async =>
      ((getLatestMessageFromTopic('Connection')).payload.toString()) ==
              'Connected'
          ? true
          : false;

  @override
  Future<String?> fetchAuthToken() async => await sendRPCMessage<String?>(
        'LocalStorageController',
        processId: 'fetch',
        args: {
          'storage_type': 'secure',
          'key': 'token',
        },
      );

  @override
  Future<bool> loginWithToken(String token) async => await sendRPCMessage<bool>(
        'AuthenticationController',
        processId: 'login',
        args: {
          'token': token,
        },
      );

  @override
  void listenToConnectivity({
    required Function onConnected,
    required Function onDisconnected,
  }) =>
      subscribeToTopic('Connection', (Message message) {
        final bool connectionResult = message.payload as bool;
        if (connectionResult == true) {
          onConnected.call();
        } else {
          onDisconnected.call();
        }
      });

  @override
  void unsubscribeFromConnectivity() => unsubscribeFromTopic('Connection');
}

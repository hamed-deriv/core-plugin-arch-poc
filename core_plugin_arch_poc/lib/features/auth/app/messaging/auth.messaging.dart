import 'dart:async';

import 'package:kafka_clone/shelf.dart';
import 'package:core_plugin_arch_poc/features/auth/app/messaging/auth.messaging.interface.dart';

final class AuthMessaging
    with ProducerMixin, ConsumerMixin
    implements AuthMessagingInterface {
  @override
  Future<String?> fetchToken() async => await sendRPCMessage<String?>(
        'LocalStorageController',
        processId: 'feth',
        args: {
          'key': 'token',
        },
      );

  @override
  Future<void> saveToken(String token) async => await sendRPCMessage<void>(
        'LocalStorageController',
        processId: 'write',
        args: {
          'storage_type': 'secure',
          'key': 'token',
          'value': token,
        },
      );

  @override
  Future<void> forgetToken() async => await sendRPCMessage<void>(
        'LocalStorageController',
        processId: 'delete',
        args: {
          'storage_type': 'secure',
          'key': 'token',
        },
      );

  @override
  void listenToRPCMessages({
    required Future<bool> Function(String) onLoginRequested,
    required Function() onLogoutRequested,
    required Function() onForgetUserRequested,
  }) =>
      subscribeToTopic('AuthenticationController', (Message message) async {
        /// Headers
        final String processId = message.headers['process_id'] as String;
        final Completer completer = message.headers['completer'] as Completer;

        switch (processId) {
          case 'login':
            final bool res = await onLoginRequested(
                message.headers['args']['token'] as String);
            completer.complete(res);
          case 'forget_user':
            onForgetUserRequested();
            completer.complete();
          case 'logout':
            onLogoutRequested();
            completer.complete();
        }
      });

  @override
  void sendLoggedInnMessage() => sendMessage('Authentication', 'LoggedIn');

  @override
  void sendLoggedOutMessage() => sendMessage('Authentication', 'LoggedOut');

  @override
  Future<void> logout() async => await sendRPCMessage(
        'AuthenticationController',
        processId: 'logout',
        args: {},
      );
}

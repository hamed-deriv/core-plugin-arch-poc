import 'package:kafka_clone/shelf.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/app/messaging/tick_stream_messaging.interface.dart';

final class TickStreamMessaging
    with ProducerMixin, ConsumerMixin
    implements TickStreamMessagingInterface {
  @override
  void forgetTickStream() => sendRPCMessage<void>(
        'TickStreamController',
        processId: 'forget',
        args: {},
      );

  @override
  String getLatestChosenSymbol() {
    try {
      return (getLatestMessageFromTopic('ChosenSymbol')).payload as String;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void listenToRPCMessages({
    required Function onForgetTickStreamRequested,
  }) {
    subscribeToTopic('TickStreamController', (Message message) async {
      /// Headers
      final String processId = message.headers['process_id'] as String;

      switch (processId) {
        case 'forget':
          onForgetTickStreamRequested();
      }
    });
  }

  @override
  void subscribeToSymbolStream({
    required Function(String) onSymbolChanged,
  }) =>
      subscribeToTopic(
        'ChosenSymbol',
        (message) => onSymbolChanged(message.payload as String),
      );

  @override
  void unSubscribeFromRPCStream() =>
      unsubscribeFromTopic('TickStreamController');

  @override
  void unSubscribeFromSymbolStream() => unsubscribeFromTopic('ChosenSymbol');
}

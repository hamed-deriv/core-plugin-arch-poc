import 'package:kafka_clone/shelf.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/app/messaging/active_symbol.messaging.interface.dart';

final class ActiveSymbolMessaging
    with ProducerMixin, ConsumerMixin
    implements ActiveSymbolMessagingInterface {
  @override
  void updateChosenSymbol(String symbol) => sendMessage('ChosenSymbol', symbol);

  @override
  String fetchLatestChosenSymbol() =>
      getLatestMessageFromTopic('ChosenSymbol').payload.toString();
}

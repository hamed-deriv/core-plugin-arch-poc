import 'package:kafka_clone/src/message/message.dart';

class ConsumerFunction {
  final String consumerId;

  final Function(Message) callback;

  ConsumerFunction(this.consumerId, this.callback);

  @override
  String toString() {
    return 'ConsumerFunction{consumerId: $consumerId, callback: $callback}';
  }
}

import 'package:kafka_clone/src/core/mixins/consumer.mixin.dart';
import 'package:kafka_clone/src/core/mixins/producer.mixin.dart';
import 'package:kafka_clone/src/message/message.dart';

class PlayerTwo with ProducerMixin, ConsumerMixin {
  PlayerTwo() {
    subscribeToTopic('PlayerTwoHp', (Message message) {
      print('Player Two defending ${message.payload}\n');
    });
  }

  void snowStormAttack() {
    print('Player Two attacking with snowstorm\n');
    sendMessage(
      'PlayerOneHp',
      'Snow Storm Attack',
    );
  }

  void mindControl() {
    print('Player Two attacking with mind control\n');
    sendMessage(
      'PlayerOneHp',
      'Mind Control',
    );
  }
}

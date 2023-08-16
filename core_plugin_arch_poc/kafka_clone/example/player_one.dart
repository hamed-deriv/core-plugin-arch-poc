import 'package:kafka_clone/src/core/mixins/consumer.mixin.dart';
import 'package:kafka_clone/src/core/mixins/producer.mixin.dart';
import 'package:kafka_clone/src/message/message.dart';

class PlayerOne with ConsumerMixin, ProducerMixin {
  PlayerOne() {
    subscribeToTopic('PlayerOneHp', (Message message) {
      print('Player One defending ${message.payload}\n');
    });
  }

  void fireballAttack() {
    print('Player One attacking with fireball\n');
    sendMessage(
      'PlayerTwoHp',
      'Fireball Attack',
    );
  }

  void swordAttack() {
    print('Player One attacking with sword\n');
    sendMessage(
      'PlayerTwoHp',
      'Sword Attack',
    );
  }
}

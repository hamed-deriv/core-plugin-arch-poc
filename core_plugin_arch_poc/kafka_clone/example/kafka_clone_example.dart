import 'package:kafka_clone/src/message_broker/message_broker.dart';

import 'player_one.dart';
import 'player_two.dart';

void main() async {
  MessageBroker.init();

  final PlayerOne one = PlayerOne();
  final PlayerTwo two = PlayerTwo();

  MessageBroker().registerTopic('PlayerOneHp');

  MessageBroker().registerTopic('PlayerTwoHp');

  await Future.delayed(Duration(seconds: 1));
  one.fireballAttack();
  await Future.delayed(Duration(seconds: 1));
  two.snowStormAttack();
  await Future.delayed(Duration(seconds: 1));
  one.swordAttack();
  await Future.delayed(Duration(seconds: 1));
  two.mindControl();
}

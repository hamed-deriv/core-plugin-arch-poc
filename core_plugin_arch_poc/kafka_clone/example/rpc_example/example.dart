import 'package:kafka_clone/shelf.dart';

import 'service_one.dart';
import 'service_two.dart';

void main() {
  MessageBroker.init();
  MessageBroker().registerTopic('One');
  MessageBroker().registerTopic('Two');

  final ServiceOne serviceOne = ServiceOne();
  final ServiceTwo serviceTwo = ServiceTwo();

  serviceOne.foo();

  serviceTwo.startListening();

  serviceOne.foo();
}

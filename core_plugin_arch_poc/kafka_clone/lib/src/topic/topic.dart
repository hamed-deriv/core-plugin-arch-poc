import 'dart:async';

import 'package:kafka_clone/src/message/message.dart';
import 'package:kafka_clone/src/topic/topic.base.dart';

class Topic extends BaseTopic {
  Topic(String topicId) : super(topicId);

  final StreamController<Message> _queue = StreamController<Message>.broadcast()
    ..add(
      Message.empty(),
    );

  Stream<Message> get dataStream => _queue.stream;

  void addMessage(Message message) {
    _queue.add(message);
    _latestMessage = message;
  }

  Message _latestMessage = Message.empty();

  Message get latestMessage => _latestMessage;
}

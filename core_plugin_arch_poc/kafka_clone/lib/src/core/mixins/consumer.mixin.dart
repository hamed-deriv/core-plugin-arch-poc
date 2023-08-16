import 'package:kafka_clone/shelf.dart';
import 'package:kafka_clone/src/topic_registrar/topic_registrar.dart';

mixin ConsumerMixin {
  final TopicRegistrar _topicRegistrar = TopicRegistrar();

  void changeSubscription(
    String topicId,
    Function(Message) callback,
  ) async {
    _topicRegistrar.unsubscribeConsumer(topicId, runtimeType.toString());
    _topicRegistrar.registerTopicSubscription(
        topicId, runtimeType.toString(), callback);
  }

  printData() => print(_topicRegistrar.toString());

  void subscribeToTopic(
    String topicId,
    Function(Message) callback,
  ) =>
      _topicRegistrar.registerTopicSubscription(
        topicId,
        runtimeType.toString() + hashCode.toString(),
        callback,
      );

  void unsubscribeFromTopic(String topicId) =>
      _topicRegistrar.unsubscribeConsumer(
        topicId,
        runtimeType.toString() + hashCode.toString(),
      );

  Message getLatestMessageFromTopic(String topicId) =>
      _topicRegistrar.readTopic(topicId).latestMessage;

  Stream<Message> getTopicStream(String topicId) {
    final res = _topicRegistrar.readTopic(topicId).dataStream;
    return res;
  }
}

import 'package:kafka_clone/shelf.dart';
import 'package:kafka_clone/src/message_broker/message_broker.base.dart';
import 'package:kafka_clone/src/topic/topic.dart';
import 'package:kafka_clone/src/topic_registrar/topic_registrar.dart';

class MessageBroker extends BaseMessageBroker {
  static MessageBroker? _instance;

  MessageBroker._();

  factory MessageBroker.init() {
    _instance = MessageBroker._();
    return _instance!;
  }

  final TopicRegistrar _topicRegistrar = TopicRegistrar();

  factory MessageBroker() {
    if (_instance == null) {
      throw MessageBrokerNotInitializedException();
    }
    return _instance!;
  }

  void registerTopic(String topicId) {
    print('registering topic $topicId');
    _topicRegistrar.createTopic(topicId);
  }

  void removeTopic(String topicId) => _topicRegistrar.deleteTopic(topicId);

  List<String> fetchTopics() => _topicRegistrar.readTopics();
  Topic fetchTopic(String topciId) => _topicRegistrar.readTopic(topciId);

  // void printTopicData(String topicId) async => print(
  //       await _topicRegistrar.readTopic(topicId).dataStream.toList(),
  //     );

  // void clearTopicData(String topicId) =>
  //     _topicRegistrar.readTopic(topicId).dataStream.drain();

  void printConsumers(String topicId) =>
      print(_topicRegistrar.getTopicSubscribers(topicId));
}

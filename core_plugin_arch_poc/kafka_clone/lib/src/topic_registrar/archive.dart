import 'package:kafka_clone/shelf.dart';
import 'package:kafka_clone/src/core/models/consumer_function_model.dart';
import 'package:kafka_clone/src/core/models/consumer_subscription_model.dart';
import 'package:kafka_clone/src/topic/topic.dart';

mixin Archive {
  final Map<String, Topic> _topics = {};

  final Map<String, List<ConsumerSubscription>> _topicConsumers = {};

  final Map<String, List<ConsumerFunction>> _lazyTopicConsumers = {};

  Map<String, Topic> get topics => _topics;

  Map<String, List<ConsumerSubscription>> get topicConsumers => _topicConsumers;

  Map<String, List<ConsumerFunction>> get lazyTopicConsumers =>
      _lazyTopicConsumers;

  bool isTopicRegistered(String topicId) => _topics.containsKey(topicId);

  Topic readTopic(String topicId) =>
      topics[topicId] ?? (throw TopicDoesNotExistException(topicId));

  List<String> readTopics() => topics.keys.toList();

  void addTopic(topicId) => _topics[topicId] = Topic(topicId);

  void addTopics(List<String> topicIds) => topicIds.forEach(addTopic);

  void removeTopic(String topicId) => _topics.remove(topicId);

  void removeTopics(List<String> topicIds) => topicIds.forEach(removeTopic);

  /// CRUD on _topicConsumers
  ///

  bool isTopicHasSubscribers(String topicId) =>
      _topicConsumers[topicId]!.isNotEmpty;

  bool isConsumerSubscribed(String topicId, String consumerId) {
    return _topicConsumers[topicId]?.any(
            (ConsumerSubscription consumerSubsciption) =>
                consumerSubsciption.consumerId == consumerId) ??
        false;
  }

  List<String> getTopicSubscribers(String topicId) => _topicConsumers[topicId]!
      .map((ConsumerSubscription consumerSubsciption) =>
          consumerSubsciption.consumerId)
      .toList();

  void addTopicSubscriber(String topicId, ConsumerSubscription sub) =>
      _topicConsumers[topicId]!.add(sub);

  void addTopicSubscribers(String topicId, List<ConsumerSubscription> subs) {
    for (ConsumerSubscription sub in subs) {
      addTopicSubscriber(topicId, sub);
    }
  }

  void removeTopicConsumer(String topicId, String consumerId) =>
      _topicConsumers[topicId]!.removeWhere(
          (ConsumerSubscription consumerSubsciption) =>
              consumerSubsciption.consumerId == consumerId);

  bool isTopicHasLazySubscribers(String topicId) =>
      _lazyTopicConsumers[topicId]?.isNotEmpty ?? false;

  void removeTopicConsumers(String topicId, List<String> consumerIds) =>
      _topicConsumers[topicId]!.clear();

  bool isConsumerLazySubscribed(String topicId, String consumerId) {
    return _lazyTopicConsumers[topicId]?.any(
            (ConsumerFunction consumerFunction) =>
                consumerFunction.consumerId == consumerId) ??
        false;
  }

  List<String> getTopicLazySubscribers(String topicId) => _lazyTopicConsumers[
          topicId]!
      .map((ConsumerFunction consumerFunction) => consumerFunction.consumerId)
      .toList();

  void addTopicLazySubscriber(String topicId, ConsumerFunction func) =>
      _lazyTopicConsumers[topicId]!.add(func);

  void addTopicLazySubscribers(String topicId, List<ConsumerFunction> funcs) {
    for (ConsumerFunction sub in funcs) {
      addTopicLazySubscriber(topicId, sub);
    }
  }

  void removeTopicLazyConsumers(String topicId) =>
      lazyTopicConsumers.remove(topicId);

  void removeTopicLazyConsumer(String topicId, String consumerId) =>
      lazyTopicConsumers.removeWhere(<String, ConsumerFunction>(topic, func) =>
          func.consumerId == consumerId);
}

import 'dart:async';

import 'package:kafka_clone/src/core/exceptions/exception.base.dart';
import 'package:kafka_clone/src/core/models/consumer_function_model.dart';
import 'package:kafka_clone/src/core/models/consumer_subscription_model.dart';
import 'package:kafka_clone/src/message/message.dart';
import 'package:kafka_clone/src/topic/topic.dart';
import 'package:kafka_clone/src/topic_registrar/archive.dart';

class TopicRegistrar with Archive {
  /// Singleton instance.
  static TopicRegistrar? _instance;

  /// Private constructor.
  TopicRegistrar._init() {
    _instance = this;
  }

  /// Factory constructor.
  factory TopicRegistrar() => _instance ?? TopicRegistrar._init();

  void createTopic(String topicId) {
    if (isTopicRegistered(topicId)) {
      /// No need to throw error -> Topic should be idempotent.
      // throw TopicAlreadyExistsException(topicId);
      return;
    } else {
      addTopic(topicId);

      isTopicHasLazySubscribers(topicId)
          ? _flushLazyConsumers(topicId)
          : topicConsumers[topicId] = [];
    }
  }

  void _flushLazyConsumers(topicId) {
    topicConsumers[topicId] =
        lazyTopicConsumers[topicId]!.map((ConsumerFunction consumerFunction) {
      final StreamSubscription subscription =
          topics[topicId]!.dataStream.listen(consumerFunction.callback);
      return ConsumerSubscription(
        consumerId: consumerFunction.consumerId,
        subscription: subscription,
      );
    }).toList();
    removeTopicLazyConsumers(topicId);
  }

  void deleteTopic(String topicId) {
    /// Check that the topic exists.
    if (isTopicRegistered(topicId)) {
      /// Check that the topic has no consumers.
      if (isTopicHasSubscribers(topicId)) {
        // _topicProducers[topicId]!.isEmpty) {
        topics.remove(topicId);
        return;
      } else {
        throw TopicHasSubscribersException(topicId);
      }
    } else {
      throw TopicDoesNotExistException(topicId);
    }
  }

  void registerTopicSubscription(
    String topicId,
    String consumerId,
    Function(Message) callback,
  ) {
    if (isTopicRegistered(topicId)) {
      final Topic targetTopic = readTopic(topicId);
      final StreamSubscription subscription =
          targetTopic.dataStream.listen(callback);
      topicConsumers[topicId]!.add(ConsumerSubscription(
        consumerId: consumerId,
        subscription: subscription,
      ));
    } else {
      lazyTopicConsumers.containsKey(topicId)
          ? lazyTopicConsumers[topicId]!.add(ConsumerFunction(
              consumerId,
              callback,
            ))
          : lazyTopicConsumers[topicId] = [
              ConsumerFunction(
                consumerId,
                callback,
              )
            ];
    }
  }

  List<String> readConsumerSubscriptions(String consumerId) {
    final List<String> subscribedTopics = [];

    topicConsumers
        .forEach((String topicId, List<ConsumerSubscription> subscriptions) {
      if (subscriptions.any((ConsumerSubscription subscription) =>
          subscription.consumerId == consumerId)) {
        subscribedTopics.add(topicId);
      }
    });
    return subscribedTopics;
  }

  void unsubscribeConsumer(String topicId, String consumerId) {
    if (isTopicRegistered(topicId)) {
      if (topicConsumers[topicId] != null) {
        final ConsumerSubscription consumerSubsciption =
            topicConsumers[topicId]!
                .where((ConsumerSubscription subscription) =>
                    subscription.consumerId == consumerId)
                .first;

        consumerSubsciption.subscription.cancel();

        topicConsumers[topicId]!.removeWhere(
            (ConsumerSubscription consumerSubsciption) =>
                consumerSubsciption.consumerId == consumerId);
      } else {
        throw ConsumerNotSubscribedException(topicId, consumerId);
      }
    } else {
      throw TopicDoesNotExistException(topicId);
    }
  }

  @override
  String toString() => '''TopicRegistrar:\n
      _topics: $topics,\n
      _topicConsumers: $topicConsumers,\n
      _lazyTopicConsumers: $lazyTopicConsumers}\n
      ''';
}

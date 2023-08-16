abstract class ExceptionStrings {
  static topicAlreadyExists(String topicId) =>
      'Topic already exists. Cannot create a topic with id: $topicId.';

  static topicDoesNotExist(String topicId) =>
      'Topic does not exist. Cannot read a topic with id: $topicId.';

  static topicHasSubscribers(String topicId) =>
      'Topic has subscribers. Cannot delete a topic with id: $topicId.';

  static topicHasNoSubscribers(String topicId) =>
      'Topic has no subscribers. Cannot add a message to a topic with id: $topicId.';

  static messageBrokerNotInitialized() =>
      'Message broker not initialized. Please use MessageBroker.init() to initialize the message broker.';

  static consumerNotSubscribed(String consumerId, String topic) =>
      'Consumer $consumerId is not subscribed to topic $topic.';

  static rpcException(String caller) =>
      'An RPC exception has been encountered when calling from $caller.';
}

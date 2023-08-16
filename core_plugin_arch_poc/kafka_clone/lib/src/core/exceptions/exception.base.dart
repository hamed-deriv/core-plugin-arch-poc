import 'package:kafka_clone/src/core/constants/error_strings.dart';

class MQException implements Exception {
  final String message;

  MQException(this.message);

  @override
  String toString() => '''
    $runtimeType: $message
''';
}

class TopicAlreadyExistsException extends MQException {
  TopicAlreadyExistsException(String topicId)
      : super(ExceptionStrings.topicAlreadyExists(topicId));
}

class TopicDoesNotExistException extends MQException {
  TopicDoesNotExistException(String topicId)
      : super(ExceptionStrings.topicDoesNotExist(topicId));
}

class TopicHasSubscribersException extends MQException {
  TopicHasSubscribersException(String topicId)
      : super(ExceptionStrings.topicHasSubscribers(topicId));
}

class TopicHasNoSubscribersException extends MQException {
  TopicHasNoSubscribersException(String topicId)
      : super(ExceptionStrings.topicHasNoSubscribers(topicId));
}

class MessageBrokerNotInitializedException extends MQException {
  MessageBrokerNotInitializedException()
      : super(ExceptionStrings.messageBrokerNotInitialized());
}

class ConsumerNotSubscribedException extends MQException {
  ConsumerNotSubscribedException(String consumerId, String topic)
      : super(ExceptionStrings.consumerNotSubscribed(consumerId, topic));
}

class RPCException extends MQException {
  RPCException(String caller) : super(ExceptionStrings.rpcException(caller));
}

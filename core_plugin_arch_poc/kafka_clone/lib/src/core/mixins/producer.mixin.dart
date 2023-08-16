import 'dart:async';

import 'package:kafka_clone/shelf.dart';
import 'package:kafka_clone/src/topic_registrar/topic_registrar.dart';

mixin ProducerMixin {
  void sendMessage(
    String topic,
    Object payload, {
    DateTime? timestamp,
    Map<String, dynamic>? headers,
  }) async {
    final TopicRegistrar topicRegistrar = TopicRegistrar();

    topicRegistrar.readTopic(topic).addMessage(Message(
          payload: payload,
          headers: headers ?? {},
          timestamp: timestamp?.toString(),
        ));
  }

  Future<T> sendRPCMessage<T>(
    String topic, {
    required String processId,
    required Map<String, dynamic> args,
    DateTime? timestamp,
    T Function(Object)? mapper,
  }) async {
    final TopicRegistrar topicRegistrar = TopicRegistrar();

    if (topicRegistrar.isTopicHasSubscribers(topic)) {
      final Completer completer =
          mapper == null ? Completer<T>() : Completer<Object>();

      // print(await topicRegistrar.readTopic(topic).listData());
      topicRegistrar.readTopic(topic).addMessage(
            Message(
              payload: '',
              timestamp: timestamp?.toString(),
              headers: {
                'type': 'RPC',
                'args': args,
                'process_id': processId,
                'completer': completer,
              },
            ),
          );

      // print(await topicRegistrar.readTopic(topic).listData());

      if (mapper == null) {
        return await completer.future.then((value) => value as T);
      } else {
        final Object rawData = await completer.future.then((value) => value);
        final T data = mapper(rawData);

        return data;
      }
    } else {
      throw TopicHasNoSubscribersException(topic);
    }
  }
}

import 'package:kafka_clone/src/core/extensions/list_extensions.dart';
import 'package:kafka_clone/src/message/message.base.dart';

class Message extends BaseMessage {
  Message({
    required this.payload,
    required this.headers,
    String? timestamp,
  }) : super(
          timestamp ?? DateTime.now().trimMilliSeconds().toString(),
        );

  Map<String, dynamic> headers;
  Object payload;

  factory Message.empty() => Message(
        payload: '',
        headers: {},
      );

  @override
  String toString() {
    return '''Message{
                headers: $headers,
                payload: $payload,
                timestamp: $timestamp,
              }''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Message &&
        other.headers == headers &&
        other.payload == payload &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode => headers.hashCode ^ payload.hashCode ^ timestamp.hashCode;
}

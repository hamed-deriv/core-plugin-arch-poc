/// Base class for all messages.
/// It is recommended to use the [BaseMessage] class to create a message.
///
/// [headers] The headers to send with the message.
/// [payload] The data to send.
/// [timestamp] The timestamp to send with the message.
///
abstract class BaseMessage {
  final String? timestamp;

  BaseMessage(this.timestamp);
}

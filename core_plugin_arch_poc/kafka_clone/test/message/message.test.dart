import 'package:kafka_clone/src/core/extensions/list_extensions.dart';
import 'package:kafka_clone/src/message/message.dart';
import 'package:test/test.dart';

void main() {
  group('Message tests', () {
    test('Message toString() should return the expected string representation',
        () {
      // Arrange
      final headers = {'Content-Type': 'application/json'};
      final payload = {'message': 'Hello, World!'};
      final timestamp = '2023-07-14 12:34:56';

      final message =
          Message(headers: headers, payload: payload, timestamp: timestamp);
      final expectedString = '''Message{
                headers: $headers,
                payload: $payload,
                timestamp: $timestamp,
              }''';

      // Act
      final result = message.toString();

      // Assert
      expect(result, expectedString);
    });

    test('Message timestamp should default to the current date and time', () {
      // Arrange
      final headers = {'Content-Type': 'application/json'};
      final payload = {'message': 'Hello, World!'};

      final message = Message(headers: headers, payload: payload);
      final expectedTimestamp = DateTime.now().trimMilliSeconds().toString();

      // Act
      final result = message.timestamp;

      // Assert
      expect(result, expectedTimestamp);
    });
  });
}

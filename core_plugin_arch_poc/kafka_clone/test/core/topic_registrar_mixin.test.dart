// import 'package:kafka_clone/src/core/exceptions/exception.base.dart';
// import 'package:kafka_clone/src/core/mixins/topic_registrar.mixin.dart';
// import 'package:kafka_clone/src/topic/topic.dart';
// import 'package:test/test.dart';

// class MockTopicRegistrar with TopicRegistrarMixin {}

// void main() {
//   group('TopicRegistrarMixin tests', () {
//     late MockTopicRegistrar topicRegistrar;

//     setUp(() {
//       topicRegistrar = MockTopicRegistrar();
//     });

//     test('isTopicRegistered should return false for a non-registered topic',
//         () {
//       // Arrange
//       final topicId = 'topic1';

//       // Act
//       final result = topicRegistrar.isTopicRegistered(topicId);

//       // Assert
//       expect(result, false);
//     });

//     test('createTopic should register a new topic', () {
//       // Arrange
//       final topicId = 'topic1';

//       // Act
//       topicRegistrar.createTopic(topicId);
//       final result = topicRegistrar.isTopicRegistered(topicId);

//       // Assert
//       expect(result, true);
//     });

//     test(
//         'createTopic should throw TopicAlreadyExistsException for an existing topic',
//         () {
//       // Arrange
//       final topicId = 'topic1';
//       topicRegistrar.createTopic(topicId);

//       // Act and Assert
//       expect(() => topicRegistrar.createTopic(topicId),
//           throwsA(isA<TopicAlreadyExistsException>()));
//     });

//     test('readTopic should return the registered topic', () {
//       // Arrange
//       final topicId = 'topic1';
//       topicRegistrar.createTopic(topicId);

//       // Act
//       final result = topicRegistrar.readTopic(topicId);

//       // Assert
//       expect(result, isA<Topic>());
//       expect(result.topicId, topicId);
//     });

//     test(
//         'readTopic should throw TopicDoesNotExistException for a non-existing topic',
//         () {
//       // Arrange
//       final topicId = 'topic1';

//       // Act and Assert
//       expect(() => topicRegistrar.readTopic(topicId),
//           throwsA(isA<TopicDoesNotExistException>()));
//     });

//     // Add more tests for other methods in TopicRegistrarMixin
//     // ...
//   });
// }

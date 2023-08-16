base class BaseLoacalStorageException implements Exception {
  final String message;

  BaseLoacalStorageException({
    required this.message,
  });

  @override
  String toString() => 'BaseLoacalStorageException(message: $message)';
}

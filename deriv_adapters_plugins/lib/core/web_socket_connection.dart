import 'dart:async';
import 'dart:convert';

import 'package:web_socket_client/web_socket_client.dart';

class WebSocketConnection {
  factory WebSocketConnection() => _instance;

  WebSocketConnection._internal()
      : _channel = WebSocket(
          Uri.parse('wss://ws.binaryws.com/websockets/v3?app_id=1089'),
          backoff: const ConstantBackoff(Duration(seconds: 1)),
          pingInterval: const Duration(seconds: 1),
        ) {
    _channel.messages
        .listen((dynamic event) => streamController.add(jsonDecode(event)));
  }

  static final WebSocketConnection _instance = WebSocketConnection._internal();

  late final WebSocket _channel;

  Future<void> request(Map<String, dynamic> request) async {
    if (_channel.connection.state != const Connected()) {
      await _channel.connection
          .firstWhere((ConnectionState state) => state is Connected);
    }

    _channel.send(jsonEncode(request));
  }

  final StreamController<dynamic> streamController =
      StreamController<dynamic>.broadcast();

  Stream<dynamic> get response => streamController.stream;

  Stream<ConnectionState> get connectionState => _channel.connection;
}

import 'dart:async';

import 'package:kafka_clone/shelf.dart';
import 'package:core_plugin_arch_poc/features/local_storage/adapter_plugin/adapters/local_storage.adapter.dart';
import 'package:core_plugin_arch_poc/features/local_storage/app/base.local_storage_manager.dart';

final class LocalStorageManager extends BaseLoacalStorageManager
    with ConsumerMixin {
  factory LocalStorageManager.init({
    required LocalStorageAdapter secureStoragePlugin,
    required LocalStorageAdapter sharedPreferencePlugin,
  }) =>
      LocalStorageManager._internal(
        secureStoragePlugin,
        sharedPreferencePlugin,
      );

  LocalStorageManager._internal(
    this.secureStoragePlugin,
    this.sharedPreferencePlugin,
  ) {
    subscribeToTopic('LocalStorageController', (Message message) {
      if (message.headers['type'] == 'RPC') {
        if (message.headers['args']['storage_type'] == 'secure') {
          _handleSecureStorageRPC(message.headers);
        } else {
          _handleSharedPreferencesRPC(message.headers);
        }
      }
    });
  }

  final LocalStorageAdapter secureStoragePlugin;
  final LocalStorageAdapter sharedPreferencePlugin;

  void _handleSharedPreferencesRPC(Map<String, dynamic> message) async {
    switch (message['process_id']) {
      case 'fetch':
        final String key = message['args']['key'];
        final String? result = await sharedPreferencePlugin.get(key);
        final Completer completer = message['completer'];
        completer.complete(result);
        break;
      case 'write':
        final String key = message['args']['key'];
        final String value = message['args']['value'];
        await sharedPreferencePlugin.setSingle(key, value);
        break;
      default:
    }
  }

  void _handleSecureStorageRPC(Map<String, dynamic> message) async {
    switch (message['process_id']) {
      case 'fetch':
        final String key = message['args']['key'];
        final String? result = await secureStoragePlugin.get(key);
        final Completer completer = message['completer'];
        completer.complete(result);
        break;
      case 'write':
        final String key = message['args']['key'];
        final String value = message['args']['value'];
        await secureStoragePlugin.setSingle(key, value);
        break;
      default:
    }
  }
}

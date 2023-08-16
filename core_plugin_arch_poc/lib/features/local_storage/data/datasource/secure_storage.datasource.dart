import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:core_plugin_arch_poc/features/local_storage/data/datasource/base.local_storage.datasource.dart';

final class SecureStorageDataSource extends BaseLocalStorageDataSource {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Future<String?> getString(String key) async => await storage.read(key: key);

  @override
  Future<List<String>> getStringList(String key) =>
      throw Exception("Secure Storage doesn't support reading lists.");

  @override
  Future<void> remove(String key) async => await storage.delete(key: key);

  @override
  Future<void> saveString(String key, String value) async =>
      await storage.write(key: key, value: value);

  @override
  Future<void> saveStringList(String key, List<String> values) =>
      throw Exception("Secure Storage doesn't support reading lists.");

  @override
  Future<void> clear() async => await storage.deleteAll();
}

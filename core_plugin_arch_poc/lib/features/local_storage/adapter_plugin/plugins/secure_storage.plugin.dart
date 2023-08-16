import 'package:core_plugin_arch_poc/core/adapter_plugin/base.adapters_plugins.dart';
import 'package:core_plugin_arch_poc/features/local_storage/adapter_plugin/adapters/local_storage.adapter.dart';
import 'package:core_plugin_arch_poc/features/local_storage/adapter_plugin/repository_implementation/secure_storage.repository_implementation.dart';
import 'package:core_plugin_arch_poc/features/local_storage/domain/contracts/local_storage.contract.dart';

class SecureStoragePlugin extends BasePlugin implements LocalStorageAdapter {
  @override
  LocalStorageRepositoryContract get repository =>
      SecureStorageRepositoryImplementation();

  @override
  Future<String?> get(String key) async => await repository.getString(key);

  @override
  Future<void> remove(String key) async => await repository.remove(key);

  @override
  Future<void> setMultiple(String key, List<String> values) async =>
      await repository.saveStringList(key, values);

  @override
  Future<void> setSingle(String key, String value) async =>
      await repository.saveString(key, value);

  @override
  Future<void> clear() async => await repository.clear();

  @override
  Future<List<String?>?> getMultiple(String key) async =>
      await repository.getStringList(key);
}

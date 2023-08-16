import 'package:core_plugin_arch_poc/core/adapter_plugin/base.adapters_plugins.dart';
import 'package:core_plugin_arch_poc/features/local_storage/data/datasource/base.local_storage.datasource.dart';
import 'package:core_plugin_arch_poc/features/local_storage/data/datasource/secure_storage.datasource.dart';
import 'package:core_plugin_arch_poc/features/local_storage/domain/contracts/local_storage.contract.dart';

class SecureStorageRepositoryImplementation extends BaseRepositoryImplementation
    implements LocalStorageRepositoryContract {
  @override
  BaseLocalStorageDataSource get dataSource => SecureStorageDataSource();

  @override
  Future<String?> getString(String key) async =>
      await dataSource.getString(key);

  @override
  Future<List<String?>?> getStringList(String key) async =>
      await dataSource.getStringList(key);

  @override
  Future<void> remove(String key) async => await dataSource.remove(key);

  @override
  Future<void> saveString(String key, String value) async =>
      await dataSource.saveString(key, value);

  @override
  Future<void> saveStringList(String key, List<String> values) async =>
      await dataSource.saveStringList(key, values);

  @override
  Future<void> clear() async => await dataSource.clear();
}

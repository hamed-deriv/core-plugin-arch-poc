import 'package:core_plugin_arch_poc/core/domain/base.domain.dart';

abstract interface class LocalStorageRepositoryContract
    extends BaseRepositoryContract {
  LocalStorageRepositoryContract(super.dataSource);

  Future<void> saveString(String key, String value);

  Future<void> saveStringList(String key, List<String> values);

  Future<String?> getString(String key);

  Future<List<String?>?> getStringList(String key);

  Future<void> remove(String key);

  Future<void> clear();
}

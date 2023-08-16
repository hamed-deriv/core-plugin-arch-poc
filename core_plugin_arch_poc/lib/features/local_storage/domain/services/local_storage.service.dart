import 'package:core_plugin_arch_poc/core/domain/base.domain.dart';

abstract interface class LocalStorageService extends BaseService {
  Future<String?> get(String key);

  Future<List<String?>?> getMultiple(String key);

  Future<void> setSingle(String key, String value);

  Future<void> setMultiple(String key, List<String> values);

  Future<void> remove(String key);

  Future<void> clear();
}

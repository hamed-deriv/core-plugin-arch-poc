import 'package:core_plugin_arch_poc/features/local_storage/data/datasource/base.local_storage.datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class SharedPreferencesDataSource extends BaseLocalStorageDataSource {
  SharedPreferencesDataSource() {
    _createSharedPreferences();
  }
  late final SharedPreferences pref;

  void _createSharedPreferences() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  Future<String?> getString(String key) async => pref.getString(key);

  @override
  Future<List<String?>?> getStringList(String key) async =>
      pref.getStringList(key);

  @override
  Future<void> remove(String key) async => await pref.remove(key);

  @override
  Future<void> saveString(String key, String value) async =>
      await pref.setString(key, value);

  @override
  Future<void> saveStringList(String key, List<String> values) async =>
      await pref.setStringList(key, values);

  @override
  Future<void> clear() async => await pref.clear();
}

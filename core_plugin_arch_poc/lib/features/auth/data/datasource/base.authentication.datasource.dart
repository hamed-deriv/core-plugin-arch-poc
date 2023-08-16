import 'package:core_plugin_arch_poc/core/data/base.data.dart';
import 'package:core_plugin_arch_poc/features/auth/data/models/authorize.model.dart';

abstract base class BaseAuthenticationDataSource extends BaseDataSource {
  Future<AuthorizeModel> login(String token);

  Future<void> logout();
}

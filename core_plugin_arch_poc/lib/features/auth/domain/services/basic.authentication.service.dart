import 'package:core_plugin_arch_poc/core/domain/base.domain.dart';
import 'package:core_plugin_arch_poc/features/auth/domain/entities/authorize.entity.dart';

abstract class AuthenticationService extends BaseService {
  Future<AuthorizeEntity> login(String token);

  Future<void> logout();
}

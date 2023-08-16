import 'package:core_plugin_arch_poc/core/domain/base.domain.dart';
import 'package:core_plugin_arch_poc/features/auth/domain/entities/authorize.entity.dart';

abstract interface class AuthenticationRepositoryContract
    extends BaseRepositoryContract {
  AuthenticationRepositoryContract(super.dataSource);

  Future<AuthorizeEntity> login(String token);

  Future<void> logout();
}

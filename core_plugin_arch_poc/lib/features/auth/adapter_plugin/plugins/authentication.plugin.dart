import 'package:core_plugin_arch_poc/core/adapter_plugin/base.adapters_plugins.dart';
import 'package:core_plugin_arch_poc/features/auth/adapter_plugin/adapters/authentication.adapter.dart';
import 'package:core_plugin_arch_poc/features/auth/adapter_plugin/authentication.repository-implementation.dart';
import 'package:core_plugin_arch_poc/features/auth/domain/contracts/authentication.contract.dart';
import 'package:core_plugin_arch_poc/features/auth/domain/entities/authorize.entity.dart';

final class AuthenticationPlugin extends BasePlugin
    implements AuthenticationAdapter {
  @override
  AuthenticationRepositoryContract get repository =>
      AuthenticationRepositoryImplementation();

  @override
  Future<AuthorizeEntity> login(String token) async =>
      await repository.login(token);

  @override
  Future<void> logout() async => await repository.logout();
}

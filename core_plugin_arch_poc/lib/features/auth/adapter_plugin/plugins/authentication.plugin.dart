import 'package:core_plugin_arch_poc/features/auth/adapter_plugin/adapters/authentication.adapter.dart';
import 'package:core_plugin_arch_poc/features/auth/adapter_plugin/repository/authentication.repository.dart';
import 'package:core_plugin_arch_poc/features/auth/domain/entities/authorize.entity.dart';

final class AuthenticationPlugin extends AuthenticationAdapter {
  AuthenticationPlugin() : super(AuthenticationRepositoryImplementation());

  @override
  Future<AuthorizeEntity> login(String token) async =>
      await repository.login(token);

  @override
  Future<void> logout() async => await repository.logout();
}

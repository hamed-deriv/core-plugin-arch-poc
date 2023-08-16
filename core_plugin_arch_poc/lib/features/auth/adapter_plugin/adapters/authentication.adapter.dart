import 'package:core_plugin_arch_poc/core/adapter_plugin/base.adapters_plugins.dart';
import 'package:core_plugin_arch_poc/features/auth/domain/contracts/authentication.contract.dart';
import 'package:core_plugin_arch_poc/features/auth/domain/services/basic.authentication.service.dart';

abstract class AuthenticationAdapter extends BaseAdapter
    implements AuthenticationService {
  AuthenticationAdapter(this.repository);

  final AuthenticationRepositoryContract repository;
}

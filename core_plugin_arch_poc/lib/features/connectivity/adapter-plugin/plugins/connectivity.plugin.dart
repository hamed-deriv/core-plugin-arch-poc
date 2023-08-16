import 'package:core_plugin_arch_poc/core/adapter_plugin/base.adapters_plugins.dart';
import 'package:core_plugin_arch_poc/features/connectivity/adapter-plugin/adapters/connectivity.adapter.dart';
import 'package:core_plugin_arch_poc/features/connectivity/adapter-plugin/repository_implementation/connectivity.repository.dart';
import 'package:core_plugin_arch_poc/features/connectivity/domain/contracts/connectivity.contract.dart';

class ConnectivityPlugin extends BasePlugin implements ConnectivityAdapter {
  ConnectivityPlugin();

  @override
  Stream<bool> fetchConnectivityStream() =>
      repository.fetchConnectivityStream();

  @override
  ConnectivityRepositoryContract get repository =>
      ConnectivityRepositoryImplementation();
}

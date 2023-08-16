import 'package:core_plugin_arch_poc/features/connectivity/adapter-plugin/adapters/connectivity.adapter.dart';
import 'package:core_plugin_arch_poc/features/connectivity/adapter-plugin/repository/connectivity.repository.dart';

final class ConnectivityPlugin extends ConnectivityAdapter {
  ConnectivityPlugin() : super(ConnectivityRepositoryImplementation());

  @override
  Stream<bool> fetchConnectivityStream() =>
      repository.fetchConnectivityStream();
}

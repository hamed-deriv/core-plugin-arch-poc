import 'package:core_plugin_arch_poc/core/adapter_plugin/base.adapters_plugins.dart';
import 'package:core_plugin_arch_poc/features/connectivity/data/base.connectivity.datasource.dart';
import 'package:core_plugin_arch_poc/features/connectivity/data/connectivity.datasource.dart';
import 'package:core_plugin_arch_poc/features/connectivity/domain/contracts/connectivity.contract.dart';

class ConnectivityRepositoryImplementation extends BaseRepositoryImplementation
    implements ConnectivityRepositoryContract {
  ConnectivityRepositoryImplementation();

  @override
  Stream<bool> fetchConnectivityStream() =>
      dataSource.fetchConnectivityStream();

  @override
  BaseConnectivityDataSource get dataSource => ConnectivityDataSource();
}

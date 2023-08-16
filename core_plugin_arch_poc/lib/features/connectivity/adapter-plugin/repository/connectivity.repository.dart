import 'package:core_plugin_arch_poc/features/connectivity/data/base.connectivity.datasource.dart';
import 'package:core_plugin_arch_poc/features/connectivity/data/connectivity.datasource.dart';
import 'package:core_plugin_arch_poc/features/connectivity/domain/contracts/connectivity.contract.dart';

class ConnectivityRepositoryImplementation
    implements ConnectivityRepositoryContract {
  ConnectivityRepositoryImplementation();

  @override
  Stream<bool> fetchConnectivityStream() =>
      dataSource.fetchConnectivityStream();

  @override
  BaseConnectivityDataSource get dataSource => ConnectivityDataSource();
}

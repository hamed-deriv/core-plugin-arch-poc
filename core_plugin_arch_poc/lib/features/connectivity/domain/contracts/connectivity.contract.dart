import 'package:core_plugin_arch_poc/core/domain/base.domain.dart';

abstract class ConnectivityRepositoryContract extends BaseRepositoryContract {
  ConnectivityRepositoryContract(super.dataSource);

  Stream<bool> fetchConnectivityStream();
}

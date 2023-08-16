import 'package:core_plugin_arch_poc/core/adapter_plugin/base.adapters_plugins.dart';
import 'package:core_plugin_arch_poc/features/connectivity/domain/contracts/connectivity.contract.dart';
import 'package:core_plugin_arch_poc/features/connectivity/domain/services/connectivity.service.dart';

abstract base class ConnectivityAdapter extends BaseAdapter
    implements ConnectivityService {
  ConnectivityAdapter(this.repository) : super(repository);

  final ConnectivityRepositoryContract repository;
}

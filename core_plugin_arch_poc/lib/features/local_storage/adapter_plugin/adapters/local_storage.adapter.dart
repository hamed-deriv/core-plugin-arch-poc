import 'package:core_plugin_arch_poc/core/adapter_plugin/base.adapters_plugins.dart';
import 'package:core_plugin_arch_poc/features/local_storage/domain/contracts/local_storage.contract.dart';
import 'package:core_plugin_arch_poc/features/local_storage/domain/services/local_storage.service.dart';

abstract base class LocalStorageAdapter extends BaseAdapter
    implements LocalStorageService {
  LocalStorageAdapter(this.repository) : super(repository);

  final LocalStorageRepositoryContract repository;
}

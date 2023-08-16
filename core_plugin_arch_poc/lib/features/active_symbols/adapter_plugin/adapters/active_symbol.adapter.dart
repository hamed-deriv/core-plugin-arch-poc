import 'package:core_plugin_arch_poc/core/adapter_plugin/base.adapters_plugins.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/domain/contracts/active_symbol.contract.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/domain/services/fetch.active_symbol.service.dart';

abstract base class ActiveSymbolAdapter extends BaseAdapter
    implements ActiveSymbolsFetchService {
  ActiveSymbolAdapter(this.repository) : super(repository);

  final ActiveSymbolsRepositoryContract repository;
}

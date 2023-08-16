import 'package:core_plugin_arch_poc/core/adapter_plugin/base.adapters_plugins.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/adapter_plugin/adapters/active_symbol.adapter.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/adapter_plugin/repository_implementations/active_symbol.repository_implementation.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/domain/entities/active_symbol_entity.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/domain/contracts/active_symbol.contract.dart';

class ActiveSymbolPlugin extends BasePlugin implements ActiveSymbolAdapter {
  @override
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols(
          Map<String, dynamic>? args) async =>
      await repository.fetchActiveSymbols(args);

  @override
  ActiveSymbolsRepositoryContract get repository =>
      ActiveSymbolRepositoryImplementation();
}

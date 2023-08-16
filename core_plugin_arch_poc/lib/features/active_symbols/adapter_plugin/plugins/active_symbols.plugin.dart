import 'package:core_plugin_arch_poc/features/active_symbols/adapter_plugin/adapters/active_symbol.adapter.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/adapter_plugin/repository/active_symbol.repository.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/domain/entities/active_symbol_entity.dart';

final class ActiveSymbolPlugin extends ActiveSymbolAdapter {
  ActiveSymbolPlugin() : super(ActiveSymbolRepositoryImplementation());

  @override
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols(
          Map<String, dynamic>? args) async =>
      await repository.fetchActiveSymbols(args);
}

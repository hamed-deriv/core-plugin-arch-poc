import 'package:core_plugin_arch_poc/core/adapter_plugin/base.adapters_plugins.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/data/data_source/active_symbol.datasource.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/data/data_source/base.active-symbol.datasource.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/data/models/active_symbol.model.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/domain/entities/active_symbol_entity.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/domain/contracts/active_symbol.contract.dart';

class ActiveSymbolRepositoryImplementation extends BaseRepositoryImplementation
    implements ActiveSymbolsRepositoryContract {
  @override
  BaseActiveSymbolDataSource get dataSource => ActiveSymbolDataSource();

  @override
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols(
          Map<String, dynamic>? args) async =>
      await dataSource.fetchActiveSymbols(args).then(
            (List<ActiveSymbolModel> modelsList) => modelsList
                .map((ActiveSymbolModel model) =>
                    ActiveSymbolEntity.fromJson(model.toJson()))
                .toList(),
          );
}

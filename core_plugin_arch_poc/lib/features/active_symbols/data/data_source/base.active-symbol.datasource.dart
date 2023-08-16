import 'package:core_plugin_arch_poc/core/data/base.data.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/data/models/active_symbol.model.dart';

abstract base class BaseActiveSymbolDataSource extends BaseDataSource {
  Future<List<ActiveSymbolModel>> fetchActiveSymbols(
      Map<String, dynamic>? args);
}

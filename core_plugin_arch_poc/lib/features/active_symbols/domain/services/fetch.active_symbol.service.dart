import 'package:core_plugin_arch_poc/core/domain/base.domain.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/domain/entities/active_symbol_entity.dart';

abstract interface class ActiveSymbolsFetchService extends BaseService {
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols(
      Map<String, dynamic>? args);
}

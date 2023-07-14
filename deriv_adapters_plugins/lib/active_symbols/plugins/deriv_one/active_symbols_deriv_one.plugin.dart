import 'package:deriv_adapters_plugins/active_symbols/adapters/deriv_one/adapter/active_symbols_deriv_one_adapter.dart';
import 'package:domain/active_symbols/active_symbols.domain.dart';

class ActiveSymbolsDerivOnePlugin extends ActiveSymbolsDerivOneAdapter {
  ActiveSymbolsDerivOnePlugin(super.repository);

  @override
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols(
          Map<String, dynamic>? args) async =>
      await repository.fetchActiveSymbols(args);
}

import 'package:deriv_adapters_plugins/active_symbols/adapters/deriv_two/adapter/active_symbols_deriv_two_adapter.dart';
import 'package:domain/active_symbols/active_symbols.domain.dart';

class ActiveSymbolsDerivTwoPlugin extends ActiveSymbolsDerivTwoAdapter {
  ActiveSymbolsDerivTwoPlugin(super.repository);

  @override
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols(
          Map<String, dynamic>? args) async =>
      await repository.fetchActiveSymbols(args);
}

import 'package:active_symbols_deriv_one/active_symbols_deriv_one.dart';

class ActiveSymbolsService extends ActiveSymbolsDerivOneAdapter {
  @override
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols(
          Map<String, dynamic>? args) async =>
      await repository.fetchActiveSymbols(args);
}

import 'package:active_symbols/active_symbols.dart';

import '../repository_implementation/active_symbols_repository.dart';

abstract class ActiveSymbolsDerivOneAdapter
    implements ActiveSymbolsFetchService {
  final ActiveSymbolsRepositoryContract repository = ActiveSymbolsRepository();

  ActiveSymbolsDerivOneAdapter();

  @override
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols(
      Map<String, dynamic>? args);
}

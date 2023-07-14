import 'package:deriv_adapters_plugins/active_symbols/adapters/base_active_symbols_adapter.dart';
import 'package:domain/domain.dart';

abstract class ActiveSymbolsDerivOneAdapter extends BaseActiveSymbolAdapter
    implements ActiveSymbolsFetchService {
  final ActiveSymbolsRepositoryContract repository;

  ActiveSymbolsDerivOneAdapter(this.repository);

  @override
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols(
      Map<String, dynamic>? args);
}

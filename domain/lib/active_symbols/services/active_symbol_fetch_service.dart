import 'package:domain/active_symbols/entities/active_symbol_entity.dart';
import 'package:domain/base/base.domain.dart';

abstract class ActiveSymbolsFetchService extends BaseService {
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols(
      Map<String, dynamic>? args);
}

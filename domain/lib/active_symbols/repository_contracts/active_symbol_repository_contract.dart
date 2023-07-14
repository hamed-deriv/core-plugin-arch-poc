import 'package:domain/active_symbols/entities/active_symbol_entity.dart';
import 'package:domain/base/base.domain.dart';

abstract class ActiveSymbolsRepositoryContract extends BaseRepositoryContract {
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols(
      Map<String, dynamic>? args);
}

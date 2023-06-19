import 'package:base_core/base_core.dart';
import '../entities/active_symbol_entity.dart';

abstract class ActiveSymbolsFetchService extends BaseService {
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols(
      Map<String, dynamic>? args);
}

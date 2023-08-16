import 'package:flutter_deriv_api/api/response/active_symbols_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/active_symbols_send.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/data/data_source/base.active-symbol.datasource.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/data/models/active_symbol.model.dart';

final class ActiveSymbolDataSource extends BaseActiveSymbolDataSource {
  @override
  Future<List<ActiveSymbolModel>> fetchActiveSymbols(
      Map<String, dynamic>? args) async {
    final ActiveSymbolsResponse result =
        await ActiveSymbolsResponse.fetchActiveSymbols(
            ActiveSymbolsRequest.fromJson(args!));

    return result.activeSymbols!
        .map((ActiveSymbolsItem activeSymbolsItem) =>
            ActiveSymbolModel.fromJson(activeSymbolsItem.toJson()))
        .toList();
  }
}

import 'package:active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/api/response/active_symbols_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/active_symbols_send.dart';

class ActiveSymbolsRepository implements ActiveSymbolsRepositoryContract {
  @override
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols(
      Map<String, dynamic>? args) async {
    final ActiveSymbolsResponse result =
        await ActiveSymbolsResponse.fetchActiveSymbols(
            ActiveSymbolsRequest.fromJson(args!));

    return result.activeSymbols!
        .map((ActiveSymbolsItem activeSymbolsItem) =>
            ActiveSymbolEntity.fromJson(activeSymbolsItem.toJson()))
        .toList();
  }
}

import 'package:flutter_deriv_api/api/response/ticks_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/ticks_send.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/data/datasource/base.tick_stream.datasource.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/data/models/tick_stream.model.dart';

final class TickStreamDataSource extends BaseTickStreamDataSource {
  @override
  Stream<TickStreamModel> fetchTickStream(String symbol) {
    final Stream<TicksResponse?> result = TicksResponse.subscribeTick(
        TicksRequest(subscribe: true, ticks: symbol));

    return result.map((TicksResponse? tick) {
      return TickStreamModel.fromJson(tick!.tick!.toJson());
    });
  }

  @override
  void forgetTickStream() async {
    await TicksResponse.unsubscribeAllTicks();
  }
}

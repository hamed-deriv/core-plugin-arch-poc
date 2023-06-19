import 'package:flutter_deriv_api/api/response/ticks_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/ticks_send.dart';
import 'package:tick_stream/tick_stream.dart';

class TickStreamRepository implements TickStreamRepositoryContract {
  @override
  Stream<TickStreamEntity> fetchTickStream(String symbol) {
    final Stream<TicksResponse?> result = TicksResponse.subscribeTick(
        TicksRequest(subscribe: true, ticks: symbol));

    return result.map((TicksResponse? tick) {
      return TickStreamEntity.fromJson(tick!.tick!.toJson());
    });
  }

  @override
  void forgetTickStream() async {
    await TicksResponse.unsubscribeAllTicks();
  }
}

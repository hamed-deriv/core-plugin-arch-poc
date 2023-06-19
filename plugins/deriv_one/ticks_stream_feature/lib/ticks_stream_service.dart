import 'package:tick_stream_deriv_one/tick_stream_deriv_one.dart';

class TicksStreamService extends TicksStreamDerivOneAdapter {
  @override
  Stream<TickStreamEntity> fetchTickStream(String symbol) =>
      repository.fetchTickStream(symbol);

  @override
  void forgetTickStream() => repository.forgetTickStream();
}

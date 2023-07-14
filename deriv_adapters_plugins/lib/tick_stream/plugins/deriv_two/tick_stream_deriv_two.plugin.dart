import 'package:deriv_adapters_plugins/tick_stream/adapters/deriv_two/adapter/ticks_stream_deriv_two_adapter.dart';
import 'package:domain/tick_stream/entities/tick_stream_entity.dart';

class TickStreamDerivTwoPlugin extends TicksStreamDerivTwoAdapter {
  TickStreamDerivTwoPlugin(super.repository);

  @override
  Stream<TickStreamEntity> fetchTickStream(String symbol) =>
      repository.fetchTickStream(symbol);

  @override
  void forgetTickStream() => repository.forgetTickStream();
}

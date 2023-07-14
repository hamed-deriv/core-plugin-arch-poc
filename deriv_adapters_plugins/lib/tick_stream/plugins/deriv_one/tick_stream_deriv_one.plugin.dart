import 'package:deriv_adapters_plugins/tick_stream/adapters/deriv_one/adapter/ticks_stream_deriv_one_adapter.dart';
import 'package:domain/tick_stream/entities/tick_stream_entity.dart';

class TickStreamDerivOnePlugin extends TicksStreamDerivOneAdapter {
  TickStreamDerivOnePlugin(super.repository);

  @override
  Stream<TickStreamEntity> fetchTickStream(String symbol) =>
      repository.fetchTickStream(symbol);

  @override
  void forgetTickStream() => repository.forgetTickStream();
}

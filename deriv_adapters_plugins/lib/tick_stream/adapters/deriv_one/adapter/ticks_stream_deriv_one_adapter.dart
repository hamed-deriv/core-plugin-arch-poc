import 'package:deriv_adapters_plugins/tick_stream/adapters/base_tick_stream_adapter.dart';
import 'package:domain/domain.dart';

abstract class TicksStreamDerivOneAdapter extends BaseTickStreamAdapter
    implements TickStreamService {
  final TickStreamRepositoryContract repository;

  TicksStreamDerivOneAdapter(this.repository);

  @override
  Stream<TickStreamEntity> fetchTickStream(String symbol);

  @override
  void forgetTickStream();
}

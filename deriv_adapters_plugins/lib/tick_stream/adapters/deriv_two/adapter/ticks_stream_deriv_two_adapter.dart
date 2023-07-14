import 'package:deriv_adapters_plugins/tick_stream/adapters/base_tick_stream_adapter.dart';
import 'package:domain/domain.dart';

abstract class TicksStreamDerivTwoAdapter extends BaseTickStreamAdapter
    implements TickStreamService {
  final TickStreamRepositoryContract repository;

  TicksStreamDerivTwoAdapter(this.repository);

  @override
  Stream<TickStreamEntity> fetchTickStream(String symbol);

  @override
  void forgetTickStream();
}

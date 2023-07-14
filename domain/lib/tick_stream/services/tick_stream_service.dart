import 'package:domain/base/base.domain.dart';
import 'package:domain/tick_stream/entities/tick_stream_entity.dart';

abstract class TickStreamService extends BaseService {
  Stream<TickStreamEntity> fetchTickStream(String symbol);

  void forgetTickStream();
}

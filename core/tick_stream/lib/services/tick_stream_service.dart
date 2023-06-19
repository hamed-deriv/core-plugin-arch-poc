import 'package:base_core/base_core.dart';
import 'package:tick_stream/entities/tick_stream_entity.dart';

abstract class TickStreamService extends BaseService {
  Stream<TickStreamEntity> fetchTickStream(String symbol);

  void forgetTickStream();
}

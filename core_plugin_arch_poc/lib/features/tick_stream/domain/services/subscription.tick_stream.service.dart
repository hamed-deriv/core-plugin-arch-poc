import 'package:core_plugin_arch_poc/core/domain/base.domain.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/domain/entities/tick_stream/tick_stream.entity.dart';

abstract interface class SubscribeTickStreamService extends BaseService {
  Stream<TickStreamEntity> fetchTickStream(String symbol);

  void forgetTickStream();
}

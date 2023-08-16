import 'package:core_plugin_arch_poc/features/tick_stream/adapter_plugin/adapters/tick_stream.adapter.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/adapter_plugin/repository/tick_stream.repository.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/domain/entities/tick_stream.entity.dart';

final class TickStreamPlugin extends TickStreamAdapter {
  TickStreamPlugin() : super(TickStreamRepository());

  @override
  Stream<TickStreamEntity> fetchTickStream(String symbol) {
    return repository.fetchTickStream(symbol).asBroadcastStream();
  }

  @override
  void forgetTickStream() => repository.forgetTickStream();
}

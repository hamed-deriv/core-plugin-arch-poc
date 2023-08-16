import 'package:core_plugin_arch_poc/core/adapter_plugin/base.adapters_plugins.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/domain/contracts/tick_stream.contract.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/domain/services/subscription.tick_stream.service.dart';

abstract base class TickStreamAdapter extends BaseAdapter
    implements SubscribeTickStreamService {
  TickStreamAdapter(this.repository);

  final TickStreamRepositoryContract repository;
}

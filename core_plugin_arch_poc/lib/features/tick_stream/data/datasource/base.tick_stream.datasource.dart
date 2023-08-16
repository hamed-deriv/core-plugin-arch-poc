import 'package:core_plugin_arch_poc/core/data/base.data.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/data/models/tick_stream.model.dart';

abstract base class BaseTickStreamDataSource extends BaseDataSource {
  void forgetTickStream();

  Stream<TickStreamModel> fetchTickStream(String symbol);
}

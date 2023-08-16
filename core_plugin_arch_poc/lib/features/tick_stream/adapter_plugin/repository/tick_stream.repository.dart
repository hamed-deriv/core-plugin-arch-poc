import 'package:core_plugin_arch_poc/features/tick_stream/data/datasource/base.tick_stream.datasource.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/data/datasource/tick_stream.datasource.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/data/models/tick_stream.model.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/domain/entities/tick_stream.entity.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/domain/contracts/tick_stream.contract.dart';

final class TickStreamRepository implements TickStreamRepositoryContract {
  @override
  BaseTickStreamDataSource get dataSource => TickStreamDataSource();

  @override
  Stream<TickStreamEntity> fetchTickStream(String symbol) =>
      dataSource.fetchTickStream(symbol).map(
            (TickStreamModel model) =>
                TickStreamEntity.fromJson(model.toJson()),
          );

  @override
  void forgetTickStream() => dataSource.forgetTickStream();
}

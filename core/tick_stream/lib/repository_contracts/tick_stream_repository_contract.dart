import 'package:tick_stream/entities/tick_stream_entity.dart';

abstract class TickStreamRepositoryContract {
  void forgetTickStream();

  Stream<TickStreamEntity> fetchTickStream(String symbol);
}

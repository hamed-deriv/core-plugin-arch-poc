import 'package:tick_stream/tick_stream.dart';
import 'package:tick_stream_deriv_one/repository_implementation/tick_stream_repository.dart';

abstract class TicksStreamDerivOneAdapter implements TickStreamService {
  final TickStreamRepositoryContract repository = TickStreamRepository();
}

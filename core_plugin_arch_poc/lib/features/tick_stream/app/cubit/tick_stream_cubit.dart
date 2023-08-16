import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/adapter_plugin/adapters/tick_stream.adapter.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/app/messaging/tick_stream_messaging.interface.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/domain/entities/tick_stream.entity.dart';

part 'tick_stream_state.dart';

class TickStreamCubit extends Cubit<TickStreamState> {
  TickStreamCubit(
    this._plugin, {
    required this.tickStreamMessaging,
  }) : super(TickStreamInitial()) {
    final String symbol = tickStreamMessaging.getLatestChosenSymbol();
    if (symbol.isNotEmpty) {
      fetchTickStream(tickStreamMessaging.getLatestChosenSymbol());
    }
    tickStreamMessaging.listenToRPCMessages(
      onForgetTickStreamRequested: forgetTickStream,
    );
    tickStreamMessaging.subscribeToSymbolStream(
      onSymbolChanged: fetchTickStream,
    );
  }

  final TickStreamAdapter _plugin;
  final TickStreamMessagingInterface tickStreamMessaging;

  void fetchTickStream(String symbol, [int maxVisibleTicks = 50]) {
    print('fetching symol $hashCode');
    emit(TickStreamLoading());

    try {
      print('forgetting previous stream');
      _plugin.forgetTickStream();

      print('fetching new strem');
      _plugin.fetchTickStream(symbol).listen((TickStreamEntity tick) {
        print('received tick ${tick.toJson()}');
        final List<TickStreamEntity> ticks = <TickStreamEntity>[];

        if (state is TickStreamLoaded) {
          final TickStreamLoaded loadedState = state as TickStreamLoaded;

          ticks.addAll(<TickStreamEntity>[...loadedState.ticks, tick]);

          if (ticks.length > maxVisibleTicks) {
            ticks.removeRange(0, ticks.length - maxVisibleTicks);
          }
        }

        emit(TickStreamLoaded(ticks));
      });
    } on Exception catch (e) {
      print(e.toString());
      emit(TickStreamError('$e'));
    }
  }

  void forgetTickStream() => _plugin.forgetTickStream();

  @override
  close() async {
    _plugin.forgetTickStream();
    tickStreamMessaging.unSubscribeFromSymbolStream();
    tickStreamMessaging.unSubscribeFromRPCStream();

    super.close();
  }
}

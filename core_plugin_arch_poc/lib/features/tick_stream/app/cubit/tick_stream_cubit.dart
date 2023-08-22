import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/adapter_plugin/adapters/tick_stream.adapter.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/app/messaging/tick_stream_messaging.interface.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/domain/entities/tick_stream/tick_stream.entity.dart';

part 'tick_stream_state.dart';

class TickStreamCubit extends Cubit<TickStreamState> {
  TickStreamCubit(
    this._plugin, {
    required this.tickStreamMessaging,
  }) : super(TickStreamInitial()) {
    tickStreamMessaging.listenToRPCMessages(
      onForgetTickStreamRequested: forgetTickStream,
    );
    tickStreamMessaging.subscribeToSymbolStream(
      onSymbolChanged: (String chosenSymbol) {
        forgetTickStream();
        fetchTickStream(chosenSymbol);
      },
    );
  }

  factory TickStreamCubit.seedSymbol({
    required TickStreamAdapter plugin,
    required TickStreamMessagingInterface tickStreamMessaging,
    required String symbol,
  }) =>
      TickStreamCubit(
        plugin,
        tickStreamMessaging: tickStreamMessaging,
      )..fetchTickStream(symbol);

  final TickStreamAdapter _plugin;
  final TickStreamMessagingInterface tickStreamMessaging;

  late StreamSubscription<TickStreamEntity>? _tickStreamSubscription;

  void fetchTickStream(String symbol, [int maxVisibleTicks = 50]) {
    emit(TickStreamLoading());

    try {
      _tickStreamSubscription =
          _plugin.fetchTickStream(symbol).listen((TickStreamEntity tick) {
        if (tick.symbol == symbol) {
          final List<TickStreamEntity> ticks = <TickStreamEntity>[];

          if (state is TickStreamLoaded) {
            final TickStreamLoaded loadedState = state as TickStreamLoaded;

            ticks.addAll(<TickStreamEntity>[...loadedState.ticks, tick]);

            if (ticks.length > maxVisibleTicks) {
              ticks.removeRange(0, ticks.length - maxVisibleTicks);
            }
          } else {
            ticks.add((tick));
            if (ticks.length > maxVisibleTicks) {
              ticks.removeRange(0, ticks.length - maxVisibleTicks);
            }
          }

          emit(TickStreamLoaded(ticks));
        }
      });
    } on Exception catch (e) {
      emit(TickStreamError('$e'));
    }
  }

  void forgetTickStream() => _plugin.forgetTickStream();

  @override
  close() async {
    if (_tickStreamSubscription != null) {
      _tickStreamSubscription?.cancel();
    }
    try {
      tickStreamMessaging.unSubscribeFromSymbolStream();
      tickStreamMessaging.unSubscribeFromRPCStream();
    } catch (e) {}

    super.close();
  }
}

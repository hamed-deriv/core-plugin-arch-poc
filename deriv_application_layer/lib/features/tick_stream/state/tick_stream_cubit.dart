import 'dart:async';

import 'package:deriv_adapters_plugins/deriv_adapters_plugins.dart';
import 'package:deriv_adapters_plugins/tick_stream/adapters/base_tick_stream_adapter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_mq/mini_mq.dart';

part 'tick_stream_state.dart';

class TickStreamCubit extends Cubit<TickStreamState> {
  TickStreamCubit(this._adapter) : super(TickStreamInitialState()) {
    final StreamSubscription<Message> streamSub =
        consumer.subscribeToTopic("TickStream");

    streamSub.onData((Message message) {
      print('Received message from TickStreamConsumer: ${message.data}');
      fetchTickStream(message.data);
    });
  }

  final Consumer consumer =
      MessageBroker().registerConsumer("TickStreamConsumer");

  final BaseTickStreamAdapter _adapter;

  void fetchTickStream(String symbol, [int maxVisibleTicks = 50]) {
    emit(const TickStreamLoadingState());

    try {
      _adapter.forgetTickStream();

      _adapter.fetchTickStream(symbol).listen((TickStreamEntity tick) {
        final List<TickStreamEntity> ticks = <TickStreamEntity>[];

        if (state is TickStreamLoadedState) {
          final TickStreamLoadedState loadedState =
              state as TickStreamLoadedState;

          ticks.addAll(<TickStreamEntity>[...loadedState.ticks, tick]);

          if (ticks.length > maxVisibleTicks) {
            ticks.removeRange(0, ticks.length - maxVisibleTicks);
          }
        }

        emit(TickStreamLoadedState(ticks));
      });
    } on Exception catch (e) {
      emit(TickStreamErrorState('$e'));
    }
  }
}

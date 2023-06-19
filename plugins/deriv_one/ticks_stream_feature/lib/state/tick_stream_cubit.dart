import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_mq/mini_mq.dart';
import 'package:tick_stream_deriv_one/tick_stream_deriv_one.dart';

import '../ticks_stream_service.dart';

part 'tick_stream_state.dart';

class TickStreamCubit extends Cubit<TickStreamState> {
  TickStreamCubit() : super(TickStreamInitialState()) {
    final StreamSubscription<Message> streamSub =
        consumer.subscribeToTopic("TickStream");

    streamSub.onData((Message message) {
      fetchTickStream(message.data);
    });
  }

  final Consumer consumer =
      MessageBroker().registerConsumer("TickStreamConsumer");

  final TicksStreamService service = TicksStreamService();

  void fetchTickStream(String symbol, [int maxVisibleTicks = 50]) {
    emit(const TickStreamLoadingState());

    try {
      service.forgetTickStream();

      service.fetchTickStream(symbol).listen((TickStreamEntity tick) {
        print(tick.id.toString());
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

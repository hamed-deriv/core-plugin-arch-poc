import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_plugin_arch_poc/features/connectivity/presentation/widgets/connectivity_listener_widget.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/adapter_plugin/plugins/tick_stream.plugin.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/app/cubit/tick_stream_cubit.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/app/messaging/tick_stream_messaging.dart';

class TickStreamGraphPage extends StatelessWidget {
  const TickStreamGraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ConnectivityListenerWidget(
      child: BlocProvider<TickStreamCubit>(
        create: (context) => TickStreamCubit.seedSymbol(
          plugin: TickStreamPlugin(),
          tickStreamMessaging: TickStreamMessaging(),
          symbol: TickStreamMessaging().getLatestChosenSymbol(),
        ),
        child: BlocBuilder<TickStreamCubit, TickStreamState>(
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: switch (state) {
                    TickStreamInitial() => Text(
                        state.toString(),
                      ),
                    TickStreamLoading() => Text(
                        state.toString(),
                      ),
                    TickStreamLoaded() => SizedBox(
                        height: 400,
                        width: 400,
                        child: Text(
                          state.ticks.toString(),
                        ),
                      ),
                    TickStreamError() => Text(
                        state.toString(),
                      ),
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

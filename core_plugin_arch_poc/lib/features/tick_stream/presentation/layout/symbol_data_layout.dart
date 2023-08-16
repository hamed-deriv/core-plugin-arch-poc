import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/adapter_plugin/plugins/tick_stream.plugin.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/app/cubit/tick_stream_cubit.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/app/messaging/tick_stream_messaging.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/app/messaging/tick_stream_messaging.interface.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/presentation/widgets/symbol_data_widget.dart';

class SymbolDataLayout extends StatelessWidget {
  const SymbolDataLayout({super.key, required this.tickStreamMessaging});

  final TickStreamMessagingInterface tickStreamMessaging;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TickStreamCubit(
        TickStreamPlugin(),
        tickStreamMessaging: TickStreamMessaging(),
      ),
      child: BlocBuilder<TickStreamCubit, TickStreamState>(
        builder: (context, state) => switch (state) {
          TickStreamInitial() => Text(state.toString()),
          TickStreamLoading() => Text(state.toString()),
          TickStreamLoaded() => SymbolDataWidget(
              ticks: state.ticks,
              // tickValues: state.ticks
              //     .map((TickStreamEntity tickStreamEntity) =>
              //         tickStreamEntity.quote)
              //     .toList(),
            ),
          TickStreamError() => Text(state.toString()),
        },
      ),
    );
  }
}

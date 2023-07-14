import 'package:deriv_adapters_plugins/tick_stream/adapters/base_tick_stream_adapter.dart';
import 'package:flutter/material.dart';
import 'package:deriv_application_layer/features/tick_stream/presentation/tick_stream_widget.dart';
import 'package:deriv_application_layer/features/tick_stream/state/tick_stream_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TickStreamPage extends StatelessWidget {
  final BaseTickStreamAdapter adapter;
  const TickStreamPage({
    required this.adapter,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: BlocProvider(
          create: (context) => TickStreamCubit(adapter),
          child: BlocBuilder<TickStreamCubit, TickStreamState>(
            builder: (BuildContext context, TickStreamState state) {
              if (state is TickStreamInitialState) {
                return const Text('Please select an active symbol.');
              } else if (state is TickStreamLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TickStreamLoadedState) {
                return state.ticks.isEmpty
                    ? const Text('Waiting for data...')
                    : Column(
                        children: <Widget>[
                          TickStreamWidget(entity: state.ticks.last),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: double.infinity,
                            height: 96,
                            child: Center(
                              child: Text(
                                state.ticks.toString(),
                              ),
                            ),
                          ),
                        ],
                      );
              } else if (state is TickStreamErrorState) {
                return Text(state.message);
              }

              return const Text('Unknown State');
            },
          ),
        ),
      );
}

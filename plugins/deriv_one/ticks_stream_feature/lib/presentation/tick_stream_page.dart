import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticks_stream_feature/presentation/basic_chart.dart';
import 'package:ticks_stream_feature/presentation/tick_stream_widget.dart';
import 'package:ticks_stream_feature/state/tick_stream_cubit.dart';

class TickStreamPage extends StatelessWidget {
  const TickStreamPage({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: BlocProvider(
          create: (context) => TickStreamCubit(),
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
                            child: BasicChart(ticks: state.ticks),
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

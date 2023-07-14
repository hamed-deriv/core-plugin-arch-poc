import 'package:deriv_adapters_plugins/deriv_adapters_plugins.dart';
import 'package:deriv_application_layer/features/active_symbols/state/active_symbols_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mini_mq/broker/message_broker.dart';
import 'package:mini_mq/producer/producer.dart';

import 'active_symbol_widget.dart';

class ActiveSymbolPage extends StatefulWidget {
  const ActiveSymbolPage({super.key});

  @override
  State<ActiveSymbolPage> createState() => _ActiveSymbolPageState();
}

class _ActiveSymbolPageState extends State<ActiveSymbolPage> {
  Producer producer = MessageBroker().registerProducer("ActiveSymbol");

  ActiveSymbolEntity? chosenActiveSymbol;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActiveSymbolsCubit(
        ActiveSymbolsDerivOnePlugin(
          ActiveSymbolsDerivOneRepository(),
        ),
      ),
      child: BlocBuilder<ActiveSymbolsCubit, ActiveSymbolState>(
        builder: (BuildContext context, ActiveSymbolState activeSymbolState) {
          if (activeSymbolState is ActiveSymbolInitialState) {
            return Center(
              child: TextButton(
                onPressed: () => BlocProvider.of<ActiveSymbolsCubit>(context)
                    .fetchActiveSymbols(),
                child: const Text("Fetch symbols"),
              ),
            );
          } else if (activeSymbolState is ActiveSymbolLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (activeSymbolState is ActiveSymbolLoadedState) {
            return ActiveSymbolWidget(
              activeSymbols: activeSymbolState.activeSymbols,
              selectedActiveSymbol: chosenActiveSymbol,
              onChanged: (ActiveSymbolEntity newActiveSymbol) {
                producer.sendMessage(
                  topicKey: 'TickStream',
                  data: newActiveSymbol.symbol,
                );
                setState(() {
                  chosenActiveSymbol = newActiveSymbol;
                });
              },
            );
          } else if (activeSymbolState is ActiveSymbolErrorState) {
            return Center(child: Text(activeSymbolState.message));
          }

          return const Center(child: Text('Unknown State'));
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/adapter_plugin/plugins/active_symbols.plugin.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/app/cubit/active_symbol_cubit.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/app/messaging/active_symbol.messaging.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/domain/entities/active_symbol_entity.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/presentation/widgets/active_symbol_dropdown.dart';

class ActiveSymbolSection extends StatelessWidget {
  const ActiveSymbolSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: BlocProvider<ActiveSymbolCubit>(
        create: (context) => ActiveSymbolCubit(
          ActiveSymbolPlugin(),
          messagingInterface: ActiveSymbolMessaging(),
        )..fetchActiveSymbols(),
        child: BlocBuilder<ActiveSymbolCubit, ActiveSymbolState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case ActiveSymbolInitial:
                return const Text('ActiveSymbolInitialState');
              case ActiveSymbolLoading:
                return const Text('ActiveSymbolLoadingState');
              case ActiveSymbolLoaded:
                return ActiveSymbolDropDown(
                  activeSymbols: (state as ActiveSymbolLoaded).activeSymbols,
                  onChanged: (ActiveSymbolEntity symbolEntity) => context
                      .read<ActiveSymbolCubit>()
                      .updateChosenSymbol(symbolEntity.symbol),
                );
              default:
                return const Text('ActiveSymbolErrorState');
            }
          },
        ),
      ),
    );
  }
}

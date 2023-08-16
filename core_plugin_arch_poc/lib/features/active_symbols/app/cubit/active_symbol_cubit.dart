import 'package:kafka_clone/shelf.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/adapter_plugin/adapters/active_symbol.adapter.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/app/messaging/active_symbol.messaging.interface.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/domain/entities/active_symbol_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'active_symbol_state.dart';

class ActiveSymbolCubit extends Cubit<ActiveSymbolState> with ProducerMixin {
  ActiveSymbolCubit(
    this._plugin, {
    required this.messagingInterface,
  }) : super(ActiveSymbolInitial());

  final ActiveSymbolAdapter _plugin;
  final ActiveSymbolMessagingInterface messagingInterface;

  Future<void> fetchActiveSymbols() async {
    emit(ActiveSymbolLoading());

    try {
      emit(
        ActiveSymbolLoaded(
          await _plugin.fetchActiveSymbols(
            <String, dynamic>{
              'active_symbols': 'brief',
              'product_type': 'basic'
            },
          ),
        ),
      );
    } on Exception catch (e) {
      emit(ActiveSymbolError('$e'));
    }
  }

  void updateChosenSymbol(String symbol) =>
      messagingInterface.updateChosenSymbol(symbol);
}

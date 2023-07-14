import 'package:bloc/bloc.dart';
import 'package:deriv_adapters_plugins/deriv_adapters_plugins.dart';

part 'active_symbols_state.dart';

class ActiveSymbolsCubit extends Cubit<ActiveSymbolState> {
  ActiveSymbolsCubit(this._adapter) : super(ActiveSymbolInitialState());

  final BaseActiveSymbolAdapter _adapter;

  Future<void> fetchActiveSymbols() async {
    emit(const ActiveSymbolLoadingState());

    try {
      emit(
        ActiveSymbolLoadedState(
          await _adapter.fetchActiveSymbols(
            <String, dynamic>{
              'active_symbols': 'brief',
              'product_type': 'basic'
            },
          ),
        ),
      );
    } on Exception catch (e) {
      emit(ActiveSymbolErrorState('$e'));
    }
  }
}

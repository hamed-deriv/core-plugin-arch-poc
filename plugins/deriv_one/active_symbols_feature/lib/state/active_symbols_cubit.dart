import 'package:active_symbols_deriv_one/active_symbols_deriv_one.dart';
import 'package:bloc/bloc.dart';

import '../active_symbols_service.dart';

part 'active_symbols_state.dart';

class ActiveSymbolsCubit extends Cubit<ActiveSymbolState> {
  ActiveSymbolsCubit() : super(ActiveSymbolInitialState());

  final ActiveSymbolsService _service = ActiveSymbolsService();

  Future<void> fetchActiveSymbols() async {
    emit(const ActiveSymbolLoadingState());

    try {
      emit(
        ActiveSymbolLoadedState(
          await _service.fetchActiveSymbols(
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

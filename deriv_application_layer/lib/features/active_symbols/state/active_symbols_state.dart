part of 'active_symbols_cubit.dart';

abstract class ActiveSymbolState {
  /// Initializes a new instance of [ActiveSymbolState].
  const ActiveSymbolState();
}

/// The [ActiveSymbolInitialState] class defines the initial state.
class ActiveSymbolInitialState extends ActiveSymbolState {
  /// Initializes a new instance of [ActiveSymbolInitialState].
  const ActiveSymbolInitialState();
}

/// The [ActiveSymbolLoadingState] class defines the loading state.
class ActiveSymbolLoadingState extends ActiveSymbolState {
  /// Initializes a new instance of [ActiveSymbolLoadingState].
  const ActiveSymbolLoadingState();
}

/// The [ActiveSymbolLoadedState] class defines the loaded state.
class ActiveSymbolLoadedState extends ActiveSymbolState {
  /// Initializes a new instance of [ActiveSymbolLoadedState].
  const ActiveSymbolLoadedState(this.activeSymbols);

  /// The list of active symbols.
  final List<ActiveSymbolEntity> activeSymbols;
}

/// The [ActiveSymbolErrorState] class defines the error state.
class ActiveSymbolErrorState extends ActiveSymbolState {
  /// Initializes a new instance of [ActiveSymbolErrorState].
  ActiveSymbolErrorState(this.message);

  final String message;
}

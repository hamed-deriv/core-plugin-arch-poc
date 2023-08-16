part of 'active_symbol_cubit.dart';

sealed class ActiveSymbolState {}

/// The [ActiveSymbolInitial] class defines the initial state.
final class ActiveSymbolInitial extends ActiveSymbolState {}

/// The [ActiveSymbolLoading] class defines the loading state.
final class ActiveSymbolLoading extends ActiveSymbolState {}

/// The [ActiveSymbolLoaded] class defines the loaded state.
final class ActiveSymbolLoaded extends ActiveSymbolState {
  /// Initializes a new instance of [ActiveSymbolLoaded].
  ActiveSymbolLoaded(this.activeSymbols);

  /// The list of active symbols.
  final List<ActiveSymbolEntity> activeSymbols;
}

/// The [ActiveSymbolError] class defines the error state.
final class ActiveSymbolError extends ActiveSymbolState {
  /// Initializes a new instance of [ActiveSymbolError].
  ActiveSymbolError(this.message);

  final String message;
}

part of 'tick_stream_cubit.dart';

@immutable
sealed class TickStreamState {}

/// The [TickStreamInitial] class defines the initial state.
class TickStreamInitial extends TickStreamState {}

/// The [TickStreamLoading] class defines the loading state.
class TickStreamLoading extends TickStreamState {}

/// The [TickStreamLoaded] class defines the loaded state.
class TickStreamLoaded extends TickStreamState {
  /// Initializes a new instance of [TickStreamLoaded].
  TickStreamLoaded([
    this.ticks = const <TickStreamEntity>[],
  ]);

  /// Tick stream entities.
  final List<TickStreamEntity> ticks;
}

/// The [TickStreamError] class defines the error state.
class TickStreamError extends TickStreamState {
  /// Initializes a new instance of [TickStreamError].
  TickStreamError(this.message);

  final String message;
}

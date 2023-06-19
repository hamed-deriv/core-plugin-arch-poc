part of 'tick_stream_cubit.dart';

abstract class TickStreamState {
  /// Initializes a new instance of [TickStreamState].
  const TickStreamState();
}

/// The [TickStreamInitialState] class defines the initial state.
class TickStreamInitialState extends TickStreamState {
  /// Initializes a new instance of [TickStreamInitialState].
  const TickStreamInitialState();
}

/// The [TickStreamLoadingState] class defines the loading state.
class TickStreamLoadingState extends TickStreamState {
  /// Initializes a new instance of [TickStreamLoadingState].
  const TickStreamLoadingState();
}

/// The [TickStreamLoadedState] class defines the loaded state.
class TickStreamLoadedState extends TickStreamState {
  /// Initializes a new instance of [TickStreamLoadedState].
  const TickStreamLoadedState([
    this.ticks = const <TickStreamEntity>[],
  ]);

  /// Tick stream entities.
  final List<TickStreamEntity> ticks;
}

/// The [TickStreamErrorState] class defines the error state.
class TickStreamErrorState extends TickStreamState {
  /// Initializes a new instance of [TickStreamErrorState].
  TickStreamErrorState(this.message);

  final String message;
}

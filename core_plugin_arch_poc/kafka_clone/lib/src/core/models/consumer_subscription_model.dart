import 'dart:async';

class ConsumerSubscription<T> {
  final String consumerId;
  final StreamSubscription<T> subscription;

  ConsumerSubscription({
    required this.consumerId,
    required this.subscription,
  });

  @override
  String toString() =>
      'ConsumerSubscription{consumerId: $consumerId, subscription: $subscription}';
}

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafka_clone/shelf.dart';
import 'package:core_plugin_arch_poc/features/splash/app/cubit/splash_state.dart';
import 'package:core_plugin_arch_poc/features/splash/app/messaging/splash_messaging.interface.dart';

class SplashCubit extends Cubit<SplashState> with ConsumerMixin, ProducerMixin {
  SplashCubit(this.messaging) : super(SplashInitial());

  late final Timer timer;
  final SplashMessagingInterface messaging;

  Future<void> _getConnectivityState() async {
    final bool connectionState = await messaging.fetchConnectionState();

    if (connectionState) {
      return;
    } else {
      await _listenToConnectivity();
      return;
    }
  }

  Future<void> _listenToConnectivity() async {
    final Completer<void> completer = Completer<void>();

    messaging.listenToConnectivity(
      onConnected: () {
        messaging.unsubscribeFromConnectivity();
        completer.complete();
      },
      onDisconnected: () => null,
    );

    await completer.future;

    return;
  }

  Future<bool> _fetchTokenAndLogin() async {
    final String? authToken = await messaging.fetchAuthToken();

    if (authToken == null) {
      return false;
    } else {
      final bool authResult = await messaging.loginWithToken(authToken);
      return authResult;
    }
  }

  Future<void> startSplash() async {
    emit(SplashLoading('Started splash'));
    timer = Timer(const Duration(seconds: 2), () async {
      emit(SplashLoading('Getting connectivity state'));
      await _getConnectivityState();
      emit(SplashLoading('Authenticating'));
      final bool authState = await _fetchTokenAndLogin();
      emit(SplashDone(isLoggedIn: authState));
    });
  }
}

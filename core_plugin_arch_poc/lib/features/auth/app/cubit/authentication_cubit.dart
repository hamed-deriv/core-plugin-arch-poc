import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_plugin_arch_poc/features/auth/adapter_plugin/adapters/authentication.adapter.dart';
import 'package:core_plugin_arch_poc/features/auth/app/messaging/auth.messaging.interface.dart';
import 'package:core_plugin_arch_poc/features/auth/domain/entities/authorize.entity.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(
    this.plugin, {
    required this.messagingInterface,
  }) : super(AuthenticationLoggedOut()) {
    messagingInterface.listenToRPCMessages(
      onLoginRequested: (String token) async {
        await login(token);
        if (state is AuthenticationLoggedIn) {
          return true;
        } else {
          return false;
        }
      },
      onLogoutRequested: () {
        logout();
        messagingInterface.forgetToken();
      },
      onForgetUserRequested: messagingInterface.forgetToken,
    );
  }

  final AuthenticationAdapter plugin;
  final AuthMessagingInterface messagingInterface;

  Future<void> login(String token) async {
    try {
      emit(AuthenticationLoading());
      if (token == '1234') {
        messagingInterface.saveToken(token);
        messagingInterface.sendLoggedInnMessage();
        emit(AuthenticationLoggedIn(AuthorizeEntity(token: '1234')));
      } else {
        throw Exception('Invalid token');
      }
    } on Exception catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      emit(AuthenticationLoading());
      await plugin.logout();
      emit(AuthenticationLoggedOut());
    } on Exception catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }
}

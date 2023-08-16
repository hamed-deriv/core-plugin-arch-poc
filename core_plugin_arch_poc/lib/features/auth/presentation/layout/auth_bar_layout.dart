import 'package:core_plugin_arch_poc/core/navigation/navigator_service.dart';
import 'package:core_plugin_arch_poc/features/auth/presentation/pages/authentication_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafka_clone/shelf.dart';
import 'package:core_plugin_arch_poc/features/auth/app/cubit/authentication_cubit.dart';
import 'package:core_plugin_arch_poc/features/auth/app/messaging/auth.messaging.interface.dart';
import 'package:core_plugin_arch_poc/features/auth/presentation/widgets/authentication_bar.dart';

class AuthenticationBarLayout extends StatelessWidget with ProducerMixin {
  const AuthenticationBarLayout({
    required this.authMessaging,
    super.key,
  });

  final AuthMessagingInterface authMessaging;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return AuthenticationBar(
          onLogOut: () async {
            await authMessaging.logout();
            if (context.mounted) {
              NavigatorService.pushAndRemoveUntil(
                context,
                const AuthenticationPage(),
              );
            }
          },
          onDeleteToken: () => authMessaging.forgetToken(),
        );
      },
    );
  }
}

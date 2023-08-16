import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_plugin_arch_poc/core/navigation/navigator_service.dart';
import 'package:core_plugin_arch_poc/features/auth/app/cubit/authentication_cubit.dart';
import 'package:core_plugin_arch_poc/features/auth/presentation/widgets/token_form.dart';
import 'package:core_plugin_arch_poc/features/home/presentation/homepage.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: _handleAuthenticationStateChange,
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: TokenForm(
              onSubmit: (String token) {
                context.read<AuthenticationCubit>().login(token);
              },
            ),
          ),
        );
      },
    );
  }

  void _handleAuthenticationStateChange(
      BuildContext context, AuthenticationState state) async {
    switch (state.runtimeType) {
      case AuthenticationLoading:
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text('Please hang on while we check your identity!'),
                content: CircularProgressIndicator(),
              );
            });
        break;
      case AuthenticationLoggedIn:
        NavigatorService.pop(context);
        await NavigatorService.push(context, const Homepage());
        break;
      case AuthenticationError:
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text((state as AuthenticationError).error),
            );
          },
        );
        break;
      default:
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text((state as AuthenticationError).error),
            );
          },
        );
        break;
    }
  }
}

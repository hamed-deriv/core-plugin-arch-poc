import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_plugin_arch_poc/core/navigation/navigator_service.dart';
import 'package:core_plugin_arch_poc/features/auth/presentation/pages/authentication_page.dart';
import 'package:core_plugin_arch_poc/features/home/presentation/homepage.dart';
import 'package:core_plugin_arch_poc/features/splash/app/cubit/splash_cubit.dart';
import 'package:core_plugin_arch_poc/features/splash/app/cubit/splash_state.dart';
import 'package:core_plugin_arch_poc/features/splash/app/messaging/splash_messaging.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SplashCubit(SplashMessaging())..startSplash(),
          child: BlocConsumer<SplashCubit, SplashState>(
            listener: (context, state) => switch (state) {
              SplashDone() => state.isLoggedIn
                  ? NavigatorService.push(
                      context,
                      const Homepage(),
                    )
                  : NavigatorService.push(
                      context,
                      const AuthenticationPage(),
                    ),
              _ => null,
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Splash is splashing...'),
                      const SizedBox(
                        height: 120,
                      ),
                      Text(state.toString()),
                      const SizedBox(
                        height: 120,
                      ),
                      const CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

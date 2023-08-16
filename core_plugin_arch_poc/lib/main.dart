import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:kafka_clone/shelf.dart';
import 'package:core_plugin_arch_poc/features/auth/adapter_plugin/plugins/authentication.plugin.dart';
import 'package:core_plugin_arch_poc/features/auth/app/cubit/authentication_cubit.dart';
import 'package:core_plugin_arch_poc/features/auth/app/messaging/auth.messaging.dart';

import 'package:core_plugin_arch_poc/features/connectivity/adapter-plugin/plugins/connectivity.plugin.dart';
import 'package:core_plugin_arch_poc/features/connectivity/app/cubit/connectivity_cubit.dart';
import 'package:core_plugin_arch_poc/features/local_storage/adapter_plugin/plugins/secure_storage.plugin.dart';
import 'package:core_plugin_arch_poc/features/local_storage/adapter_plugin/plugins/shared_preferences.plugin.dart';
import 'package:core_plugin_arch_poc/features/local_storage/app/local_sorage_manager.dart';

import 'features/splash/presentation/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  APIInitializer().initialize(
      api: BinaryAPI(enableDebug: true)
        ..connect(ConnectionInformation(
          appId: "1089",
          brand: 'deriv',
          endpoint: 'blue.binaryws.com',
        )));

  LocalStorageManager.init(
    secureStoragePlugin: SecureStoragePlugin(),
    sharedPreferencePlugin: SharedPreferencesPlugin(),
  );

  /// Initialize the message broker.
  MessageBroker.init();

  /// Messaging topics.
  MessageBroker().registerTopic('ChosenSymbol');
  MessageBroker().registerTopic('Connection');
  MessageBroker().registerTopic('Authentication');

  /// RPC topics.
  MessageBroker().registerTopic('LocalStorageController');
  MessageBroker().registerTopic('AuthenticationController');
  MessageBroker().registerTopic('TickStreamController');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ConnectivityCubit(ConnectivityPlugin()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => AuthenticationCubit(
            AuthenticationPlugin(),
            messagingInterface: AuthMessaging(),
          ),
        ),
      ],
      child: BlocBuilder<ConnectivityCubit, ConnectivityState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
              useMaterial3: true,
            ),
            home: const SplashPage(),
          );
        },
      ),
    );
  }
}

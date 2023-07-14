import 'package:deriv_adapters_plugins/deriv_adapters_plugins.dart';
import 'package:deriv_application_layer/features/tick_stream/presentation/tick_stream_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:mini_mq/broker/message_broker.dart';

import 'active_symbol/active_symbol_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  MessageBroker();
  APIInitializer().initialize(
      api: BinaryAPI(enableDebug: true)
        ..connect(ConnectionInformation(
          appId: "1089",
          brand: 'deriv',
          endpoint: 'blue.binaryws.com',
        )));

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Distributed Architecture 1'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 60, child: ActiveSymbolPage()),
                Expanded(
                  child: TickStreamPage(
                    adapter: TickStreamDerivOnePlugin(
                      TickStreamDerivOneRepository(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

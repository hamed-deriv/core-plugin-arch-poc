import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:mini_mq/broker/message_broker.dart';
import 'package:ticks_stream_feature/presentation/tick_stream_page.dart';

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
            title: const Text('Layered Architecture'),
          ),
          body: const Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                SizedBox(height: 60, child: ActiveSymbolPage()),
                Expanded(child: TickStreamPage()),
              ],
            ),
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:core_plugin_arch_poc/features/active_symbols/presentation/layout/active_symbol_section.dart';
import 'package:core_plugin_arch_poc/features/auth/app/messaging/auth.messaging.dart';
import 'package:core_plugin_arch_poc/features/auth/presentation/layout/auth_bar_layout.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/app/messaging/tick_stream_messaging.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/presentation/layout/symbol_data_layout.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/presentation/widgets/forget_button.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/presentation/widgets/graph_view_button.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text('Plugin Architecture POC'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AuthenticationBarLayout(authMessaging: AuthMessaging()),
          const SizedBox(height: 20),
          const ActiveSymbolSection(),
          const Spacer(),
          SymbolDataLayout(
            tickStreamMessaging: TickStreamMessaging(),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ForgetButton(
                tickStreamMessaging: TickStreamMessaging(),
              ),
              GraphViewButton(
                tickStreamMessaging: TickStreamMessaging(),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

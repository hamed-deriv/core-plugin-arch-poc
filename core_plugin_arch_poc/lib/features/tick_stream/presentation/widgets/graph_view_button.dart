import 'package:flutter/material.dart';
import 'package:kafka_clone/shelf.dart';
import 'package:core_plugin_arch_poc/core/navigation/navigator_service.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/app/messaging/tick_stream_messaging.interface.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/presentation/pages/tick_stream_graph_page.dart';

class GraphViewButton extends StatelessWidget with ConsumerMixin {
  GraphViewButton({
    required this.tickStreamMessaging,
    super.key,
  });

  final TickStreamMessagingInterface tickStreamMessaging;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: () async {
        final String symbol = tickStreamMessaging.getLatestChosenSymbol();
        if (symbol.isNotEmpty) {
          if (context.mounted) {
            tickStreamMessaging.forgetTickStream();
            NavigatorService.push(
              context,
              const TickStreamGraphPage(),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please choose a symbol first.'),
              ),
            );
          }
        }
      },
      child: const Text('Graph View'),
    );
  }
}

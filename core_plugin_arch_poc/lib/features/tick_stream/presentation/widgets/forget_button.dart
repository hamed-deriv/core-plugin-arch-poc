import 'package:flutter/material.dart';
import 'package:kafka_clone/shelf.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/app/messaging/tick_stream_messaging.interface.dart';

class ForgetButton extends StatelessWidget with ProducerMixin {
  ForgetButton({
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
        backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: tickStreamMessaging.forgetTickStream,
      child: const Text('Forget'),
    );
  }
}

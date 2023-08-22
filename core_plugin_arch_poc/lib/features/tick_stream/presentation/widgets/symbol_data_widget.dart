import 'package:flutter/material.dart';
import 'package:core_plugin_arch_poc/features/tick_stream/domain/entities/tick_stream/tick_stream.entity.dart';

class SymbolDataWidget extends StatelessWidget {
  const SymbolDataWidget({
    required this.ticks,
    super.key,
  });

  final List<TickStreamEntity> ticks;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Symbol:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            if (ticks.isNotEmpty)
              Text(
                ticks.last.symbol,
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quote:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            if (ticks.isNotEmpty)
              Text(ticks.last.quote.toString(),
                  style: _getQuoteTextStyle(ticks)),
          ],
        ),
      ],
    );
  }

  TextStyle _getQuoteTextStyle(List<TickStreamEntity> ticks) {
    if (ticks.length < 2) {
      return const TextStyle(
        color: Colors.grey,
      );
    } else if (ticks.last.quote > ticks[ticks.length - 2].quote) {
      return const TextStyle(
        color: Colors.green,
      );
    } else if (ticks.last.quote < ticks[ticks.length - 2].quote) {
      return const TextStyle(
        color: Colors.red,
      );
    } else {
      return const TextStyle(
        color: Colors.grey,
      );
    }
  }
}

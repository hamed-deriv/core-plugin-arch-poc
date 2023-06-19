import 'dart:math';

import 'package:flutter/material.dart';

import 'package:tick_stream_deriv_one/tick_stream_deriv_one.dart';

class BasicChart extends StatelessWidget {
  const BasicChart({required this.ticks, super.key});

  final List<TickStreamEntity> ticks;

  @override
  Widget build(BuildContext context) =>
      CustomPaint(painter: _BasicChartPainter(data: ticks));
}

class _BasicChartPainter extends CustomPainter {
  _BasicChartPainter({required this.data});

  final List<TickStreamEntity> data;

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    double minX = double.infinity;
    double maxX = -double.infinity;
    double minY = double.infinity;
    double maxY = -double.infinity;

    final Paint areaPaint = Paint()..color = Colors.grey;

    final Paint axisPaint = Paint()..strokeWidth = 1.0;

    for (final TickStreamEntity entity in data) {
      minX = min(minX, entity.epoch.toDouble());
      maxX = max(maxX, entity.epoch.toDouble());
      minY = min(minY, entity.quote);
      maxY = max(maxY, entity.quote);
    }

    canvas.drawLine(Offset(0, height), Offset(width, height), axisPaint);

    final Path path = Path();
    for (int i = 0; i < data.length; i++) {
      final TickStreamEntity entity = data[i];

      final double x = width * ((entity.epoch - minX) / (maxX - minX));
      final double y = height * (1 - ((entity.quote - minY) / (maxY - minY)));

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    final Path areaPath = Path.from(path)
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    canvas.drawPath(areaPath, areaPaint);
  }

  @override
  bool shouldRepaint(_BasicChartPainter oldDelegate) =>
      oldDelegate.data != data;
}

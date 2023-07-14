import 'package:deriv_adapters_plugins/deriv_adapters_plugins.dart';
import 'package:flutter/material.dart';

class TickStreamWidget extends StatefulWidget {
  const TickStreamWidget({required this.entity, super.key});

  final TickStreamEntity entity;

  @override
  State<TickStreamWidget> createState() => _TickStreamWidgetState();
}

class _TickStreamWidgetState extends State<TickStreamWidget> {
  Color _color = Colors.black;

  @override
  void didUpdateWidget(TickStreamWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.entity != widget.entity) {
      widget.entity.quote == oldWidget.entity.quote
          ? _color = Colors.black
          : widget.entity.quote > oldWidget.entity.quote
              ? _color = Colors.green
              : _color = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Text(
                'Symbol: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.entity.symbol)
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: <Widget>[
              const Text(
                'Quote: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${widget.entity.quote}', style: TextStyle(color: _color))
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: <Widget>[
              const Text(
                'Epoch: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${widget.entity.epoch}')
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: <Widget>[
              const Text(
                'Id: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.entity.id)
            ],
          ),
        ],
      );
}

import 'package:flutter/material.dart';

class ConnectionDialog extends AlertDialog {
  const ConnectionDialog({super.key})
      : super(
          content: const Column(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 16.0,
              ),
              Text('Checking you connection...'),
            ],
          ),
        );
}

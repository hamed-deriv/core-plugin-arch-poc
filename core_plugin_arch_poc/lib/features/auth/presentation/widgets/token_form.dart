import 'package:flutter/material.dart';

class TokenForm extends StatelessWidget {
  TokenForm({
    required this.onSubmit,
    super.key,
  });

  final Function(String) onSubmit;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Token',
          ),
        ),
        TextButton(
          onPressed: () => onSubmit(_controller.text),
          child: const Text('Log In'),
        ),
      ],
    );
  }
}

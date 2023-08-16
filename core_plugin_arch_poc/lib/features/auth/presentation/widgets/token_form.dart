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
            labelStyle: TextStyle(color: Colors.grey),
            labelText: 'Token',
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              Colors.grey[300],
            ),
          ),
          onPressed: () => onSubmit(_controller.text),
          child: const Text(
            'Log In',
          ),
        ),
      ],
    );
  }
}

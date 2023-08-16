import 'package:flutter/material.dart';

class AuthenticationBar extends StatelessWidget {
  const AuthenticationBar({
    required this.onLogOut,
    required this.onDeleteToken,
    super.key,
  });

  final VoidCallback onLogOut;
  final VoidCallback onDeleteToken;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.grey.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: onDeleteToken,
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.redAccent),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            child: const Text('Delete token'),
          ),
          TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: onLogOut,
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}

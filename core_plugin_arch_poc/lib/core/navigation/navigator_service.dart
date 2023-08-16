import 'package:flutter/material.dart';

class NavigatorService {
  static Future<T?> push<T extends Object?>(
          BuildContext context, Widget page) =>
      Navigator.push<T>(
        context,
        MaterialPageRoute(builder: (context) => page),
      );

  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
          BuildContext context, Widget page) =>
      Navigator.pushReplacement<T, TO>(
        context,
        MaterialPageRoute(builder: (context) => page),
      );

  static void pop<T extends Object?>(BuildContext context, [T? result]) =>
      Navigator.pop(context, result);

  static void pushAndRemoveUntil(BuildContext context, Widget page) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => page),
        (route) => false,
      );
}

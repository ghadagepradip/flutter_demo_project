import 'package:flutter/material.dart';

class SnackBarUtil {
  static void show(
      BuildContext context,
      String message, {
        Color backgroundColor = Colors.black87,
        Color textColor = Colors.white,
        Duration duration = const Duration(seconds: 2),
        SnackBarAction? action,
      }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: textColor),
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        action: action,
      ),
    );
  }
}

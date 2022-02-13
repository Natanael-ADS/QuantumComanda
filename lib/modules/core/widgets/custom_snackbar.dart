import 'package:flutter/material.dart';

class CustomSnackbar {
  static void success(BuildContext context, String content) {
    _show(context, content, Colors.green);
  }

  static void alert(BuildContext context, String content) {
    _show(context, content, Colors.orange);
  }

  static void error(BuildContext context, String content) {
    _show(context, content, Colors.red);
  }

  static void info(BuildContext context, String content) {
    _show(context, content, Colors.blue);
  }

  static void _show(BuildContext context, String content, Color color) {
    final snackBar = SnackBar(
      content: Text(content),
      duration: const Duration(seconds: 5),
      backgroundColor: color,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

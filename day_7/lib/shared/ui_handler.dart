import 'package:flutter/material.dart';

class UIHandler {
  void showSuccessSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(content), backgroundColor: Colors.green),
    );
  }

  void showErrorSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(content), backgroundColor: Colors.red),
    );
  }
}

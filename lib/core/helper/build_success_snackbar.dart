import 'package:flutter/material.dart';

void buildSucessSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: const Color.fromARGB(255, 63, 215, 69),
      content: Text(text),
    ),
  );
}

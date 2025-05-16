import 'package:flutter/material.dart';

void buildSuccessSnackBar(BuildContext context, String text,
    {Duration? duration = const Duration(seconds: 2)}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: duration ?? const Duration(seconds: 2),
      backgroundColor: const Color.fromARGB(255, 63, 215, 69),
      content: Text(text),
    ),
  );
}

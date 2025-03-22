import 'package:flutter/material.dart';

void buildErrorBar(BuildContext context, String messgae) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(messgae),
    ),
  );
}

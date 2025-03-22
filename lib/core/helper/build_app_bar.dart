import 'package:chatbot/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar({required String text}) {
  return AppBar(
    title: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    centerTitle: true,
    backgroundColor: AppColors.primaryColor,
  );
}

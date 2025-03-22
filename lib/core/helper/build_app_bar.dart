import 'package:chatbot/core/helper/get_user.dart';
import 'package:chatbot/core/utils/app_colors.dart';
import 'package:chatbot/core/utils/app_images.dart';
import 'package:chatbot/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar({required String text, bool centerTitle = true}) {
  return AppBar(
    title: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    centerTitle: centerTitle,
    backgroundColor: AppColors.primaryColor,
    actions: centerTitle == true
        ? null
        : [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    getUser().name.toString(),
                    style: AppTextStyles.bold16.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Image.asset(
                      Assets.imagesProfileImage,
                    ),
                  ),
                ],
              ),
            )
          ],
  );
}

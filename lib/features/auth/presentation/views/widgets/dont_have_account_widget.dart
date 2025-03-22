import 'package:chatbot/core/routing/app_router.dart';
import 'package:chatbot/core/utils/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppTextStyles.semiBold16,
        children: [
          TextSpan(
            text: S.of(context).dont_have_an_account,
            style:
                AppTextStyles.semiBold16.copyWith(color: AppColors.lightWhite),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                GoRouter.of(context).push(AppRouter.kSignUpView);
              },
            text: '  ${S.of(context).create_account}',
            style:
                AppTextStyles.semiBold16.copyWith(color: AppColors.greenColor),
          )
        ],
      ),
    );
  }
}

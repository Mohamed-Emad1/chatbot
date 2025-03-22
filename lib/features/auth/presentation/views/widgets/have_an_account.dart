import 'package:chatbot/core/utils/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppTextStyles.semiBold16,
        children: [
          TextSpan(
            text: S.of(context).have_an_account,
            style:
                AppTextStyles.semiBold16.copyWith(color: AppColors.lightWhite),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
            text: '  ${S.of(context).sign_in}',
            style:
                AppTextStyles.semiBold16.copyWith(color: AppColors.greenColor),
          )
        ],
      ),
    );
  }
}

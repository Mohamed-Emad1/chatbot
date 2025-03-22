import 'package:chatbot/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.image});

  final VoidCallback onPressed;
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            side: BorderSide(
              color: Color(0xffDDDFDF),
            ),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          leading: SvgPicture.asset(image),
          title: Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold16.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

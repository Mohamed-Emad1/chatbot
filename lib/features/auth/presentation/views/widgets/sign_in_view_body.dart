import 'package:chatbot/core/utils/app_images.dart';
import 'package:chatbot/core/widgets/custom_button.dart';
import 'package:chatbot/core/widgets/custom_text_form_field.dart';
import 'package:chatbot/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:chatbot/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:chatbot/generated/l10n.dart';
import 'package:flutter/material.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: _autovalidateMode,
      key: _formKey,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomTextFormField(hintText: S.of(context).email),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(hintText: S.of(context).password),
                const SizedBox(
                  height: 32,
                ),
                CustomButton(
                  text: S.of(context).sign_in,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 16,
                ),
                const DontHaveAccountWidget(),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  S.of(context).or,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 24,
                ),
                const SizedBox(
                  height: 12,
                ),
                SocialLoginButton(
                  onPressed: () {},
                  text: S.of(context).sign_in_with_google,
                  image: Assets.imagesGoogleIcon,
                ),
                const SizedBox(
                  height: 12,
                ),
                SocialLoginButton(
                  onPressed: () {},
                  text: S.of(context).sign_in_with_facebook,
                  image: Assets.imagesFacebookIcon,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

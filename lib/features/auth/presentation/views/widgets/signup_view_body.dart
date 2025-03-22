import 'package:chatbot/core/widgets/custom_button.dart';
import 'package:chatbot/core/widgets/custom_text_form_field.dart';
import 'package:chatbot/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:chatbot/generated/l10n.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
              height: 16,
            ),
            CustomTextFormField(hintText: S.of(context).full_name),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
              text: S.of(context).signup,
              onPressed: () {},
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: Colors.white,
              height: 24,
            ),
            const SizedBox(
              height: 16,
            ),
            const HaveAnAccount(),
            const SizedBox(
              height: 12,
            ),
          ],
        ))
      ],
    );
  }
}

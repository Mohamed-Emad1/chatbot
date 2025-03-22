import 'package:chatbot/core/helper/build_app_bar.dart';
import 'package:chatbot/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';
import 'package:chatbot/generated/l10n.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: S.of(context).signup),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: SignUpViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}

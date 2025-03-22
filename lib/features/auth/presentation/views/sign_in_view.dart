import 'package:chatbot/core/helper/build_app_bar.dart';
import 'package:chatbot/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: "Sign In"),
      body: const SafeArea(child: SignInViewBody()),
    );
  }
}

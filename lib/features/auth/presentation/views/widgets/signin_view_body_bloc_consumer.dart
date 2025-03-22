import 'package:chatbot/core/helper/build_error_bar.dart';
import 'package:chatbot/core/helper/build_success_snackbar.dart';
import 'package:chatbot/core/routing/app_router.dart';
import 'package:chatbot/core/widgets/custom_progress_hud.dart';
import 'package:chatbot/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:chatbot/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:chatbot/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          buildSucessSnackBar(context, S.of(context).sign_in_successfully);
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        } else if (state is SignInFailure) {
          buildErrorBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignInLoading,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: SignInViewBody(),
          ),
        );
      },
    );
  }
}

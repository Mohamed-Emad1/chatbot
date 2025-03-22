import 'package:chatbot/core/helper/build_error_bar.dart';
import 'package:chatbot/core/helper/build_success_snackbar.dart';
import 'package:chatbot/core/widgets/custom_progress_hud.dart';
import 'package:chatbot/features/auth/presentation/manager/signup_cubit/cubit/signup_cubit.dart';
import 'package:chatbot/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:chatbot/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          buildSucessSnackBar(context, S.of(context).sign_up_successfully);
          GoRouter.of(context).pop();
          buildSucessSnackBar(context, S.of(context).sign_in_after_sign_up);
        } else if (state is SignupFailure) {
          buildErrorBar(context, S.of(context).sign_up_fail);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignupLoading,
          child: const SignupViewBody(),
        );
      },
    );
  }
}

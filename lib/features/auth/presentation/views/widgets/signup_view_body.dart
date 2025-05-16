import 'package:chatbot/core/widgets/custom_button.dart';
import 'package:chatbot/core/widgets/custom_text_form_field.dart';
import 'package:chatbot/features/auth/presentation/manager/signup_cubit/cubit/signup_cubit.dart';
import 'package:chatbot/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:chatbot/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  late String email, password, fullName;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

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
                CustomTextFormField(
                  onSaved: (value) {
                    fullName = value!;
                  },
                  hintText: S.of(context).full_name,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: S.of(context).email,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    password = value!;
                  },
                  hintText: S.of(context).password,
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomButton(
                  text: S.of(context).signup,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      BlocProvider.of<SignupCubit>(context)
                          .createUserWithEmailAndPassword(
                              email, password, fullName);
                    } else {
                      setState(() {
                        _autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
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
            ),
          ),
        ],
      ),
    );
  }
}

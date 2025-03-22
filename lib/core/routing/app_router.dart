import 'package:chatbot/core/services/service_locator.dart';
import 'package:chatbot/features/auth/domain/repos/auth_repo.dart';
import 'package:chatbot/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:chatbot/features/auth/presentation/manager/signup_cubit/cubit/signup_cubit.dart';
import 'package:chatbot/features/auth/presentation/views/sign_in_view.dart';
import 'package:chatbot/features/auth/presentation/views/signup_view.dart';
import 'package:chatbot/features/home/presentation/views/home_view.dart';
import 'package:chatbot/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kSplashView = '/splashView';
  static const kSignInView = '/signInView';
  static const kSignUpView = '/signUpView';

  static final router = GoRouter(
    initialLocation: kSplashView, // default start
    routes: [
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSignInView,
        builder: (context, state) => BlocProvider(
          create: (context) => SignInCubit(getIt.get<AuthRepo>()),
          child: const SignInView(),
        ),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => BlocProvider(
          create: (context) => SignupCubit(
            getIt.get<AuthRepo>(),
          ),
          child: const SignupView(),
        ),
      ),
    ],
  );
}

import 'package:chatbot/features/auth/presentation/views/sign_in_view.dart';
import 'package:chatbot/features/home/presentation/views/home_view.dart';
import 'package:chatbot/features/splash/presentation/views/splash_view.dart';
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
        builder: (context, state) => const SignInView(),
      ),
    ],
  );
}

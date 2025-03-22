import 'package:chatbot/core/routing/app_router.dart';
import 'package:chatbot/core/services/firebase_auth_service.dart';
import 'package:chatbot/core/utils/app_images.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/services/service_locator.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            Assets.imagesChatbot,
            height: 70,
            width: 70,
          ),
        )
      ],
    );
  }

  void executeNavigation() {
    Future.delayed(const Duration(seconds: 2), () {
      if (getIt.get<FirebaseAuthService>().isLoggedIn()) {
        GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
      } else {
        GoRouter.of(context).pushReplacement(AppRouter.kSignInView);
      }
    });
  }
}

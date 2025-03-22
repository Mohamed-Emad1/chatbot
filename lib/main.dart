import 'package:chatbot/core/routing/app_router.dart';
import 'package:chatbot/core/services/bloc_observer.dart';
import 'package:chatbot/core/services/service_locator.dart';
import 'package:chatbot/core/services/shared_prefrences_singletone.dart';
import 'package:chatbot/core/utils/app_colors.dart';
import 'package:chatbot/firebase_options.dart';
import 'package:chatbot/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferencesSingleton.init();
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  runApp(const ChatBotApp());
}

class ChatBotApp extends StatelessWidget {
  const ChatBotApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.secondaryColor,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      title: 'ChatBot',
      routerConfig: AppRouter.router,
    );
  }
}

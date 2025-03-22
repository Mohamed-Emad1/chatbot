import 'package:chatbot/core/routing/app_router.dart';
import 'package:chatbot/core/services/bloc_observer.dart';
import 'package:chatbot/core/services/shared_prefrences_singletone.dart';
import 'package:chatbot/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await SharedPreferencesSingleton.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.secondaryColor,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: AppRouter.router,
    );
  }
}

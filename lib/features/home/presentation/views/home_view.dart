import 'package:chatbot/core/helper/build_app_bar.dart';
import 'package:chatbot/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        text: "ChatBot",
      ),
      body: const SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}

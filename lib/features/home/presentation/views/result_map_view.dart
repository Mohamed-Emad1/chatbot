import 'package:chatbot/features/home/presentation/views/widgets/result_map_view_body.dart';
import 'package:flutter/material.dart';

class ResultMapView extends StatelessWidget {
  const ResultMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map Result"),
        centerTitle: false,
      ),
      body: const SafeArea(
        child: ResultMapViewBody(),
      ),
    );
  }
}

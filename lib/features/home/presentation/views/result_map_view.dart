import 'package:chatbot/features/home/data/model/tree_model/tree_model.dart';
import 'package:chatbot/features/home/presentation/views/widgets/result_map_view_body.dart';
import 'package:flutter/material.dart';

class ResultMapView extends StatelessWidget {
  const ResultMapView({super.key, required this.map});

  final TreeModel map;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map Result"),
        centerTitle: false,
      ),
      body: SafeArea(
        child: ResultMapViewBody(
          treeModel:map,
        ),
      ),
    );
  }
}

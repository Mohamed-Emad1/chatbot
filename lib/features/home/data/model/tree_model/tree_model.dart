class TreeModel {
  final List<Map<String, dynamic>> data;
  TreeModel({required this.data});

  factory TreeModel.fromJson(Map<String, dynamic> json) {
    return TreeModel(
      data: (json['data'] as List<dynamic>).cast<Map<String, dynamic>>(),
    );
  }
}

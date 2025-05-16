import 'dart:convert';

class TreeModel {
  bool? checked;
  bool? show;
  List<dynamic>? children;
  int? id;
  int? pid;
  int? commonId;
  String? title;

  TreeModel({
    this.checked,
    this.show,
    this.children,
    this.id,
    this.pid,
    this.commonId,
    this.title,
  });

  factory TreeModel.fromMap(Map<String, dynamic> data) => TreeModel(
        checked: data['checked'] as bool?,
        show: data['show'] as bool?,
        children: data['children'] as List<dynamic>?,
        id: data['id'] as int?,
        pid: data['pid'] as int?,
        commonId: data['commonID'] as int?,
        title: data['title'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'checked': checked,
        'show': show,
        'children': children,
        'id': id,
        'pid': pid,
        'commonID': commonId,
        'title': title,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TreeModel].
  factory TreeModel.fromJson(String data) {
    return TreeModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TreeModel] to a JSON string.
  String toJson() => json.encode(toMap());
}

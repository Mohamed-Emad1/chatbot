import 'package:chatbot/features/home/data/model/tree_model/tree_model.dart';
import 'package:flutter/material.dart';
import 'package:generate_tree/treeNode.dart';

class ResultMapViewBody extends StatefulWidget {
  const ResultMapViewBody({super.key, required this.treeModel});
  final TreeModel treeModel;

  @override
  State<ResultMapViewBody> createState() => _ResultMapViewBodyState();
}

class _ResultMapViewBodyState extends State<ResultMapViewBody> {
  late List<TreeNode> nodes;

  @override
  void initState() {
    super.initState();
    nodes =
        widget.treeModel.data.map((item) => TreeNode.fromJson(item)).toList();
  }

  void _onNodeChecked(TreeNode node, bool? value) {
    final newValue = value ?? false;
    setState(() {
      // 1. Set this node and all descendants
      _setNodeAndDescendants(node, newValue);
      // 2. Recompute all ancestors
      _updateAncestors(nodes, node.id);
    });
  }

  void _setNodeAndDescendants(TreeNode node, bool checked) {
    node.checked = checked;
    for (var child in node.children) {
      _setNodeAndDescendants(child, checked);
    }
  }

  void _updateAncestors(List<TreeNode> list, int childId) {
    for (var parent in list) {
      if (parent.children.any((c) => c.id == childId)) {
        parent.checked = parent.children.every((c) => c.checked);
        _updateAncestors(nodes, parent.id);
      } else {
        _updateAncestors(parent.children, childId);
      }
    }
  }

  void _deleteNode(int id) {
    setState(() {
      nodes.removeWhere((n) => n.id == id);
      _removeRecursively(nodes, id);
    });
  }

  void _removeRecursively(List<TreeNode> list, int id) {
    for (var n in list) {
      n.children.removeWhere((c) => c.id == id);
      _removeRecursively(n.children, id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: nodes.map(_buildTile).toList(),
    );
  }

  Widget _buildTile(TreeNode node) {
    return GestureDetector(
      onLongPress: () => _showDeleteDialog(node),
      child: ExpansionTile(
        key: ValueKey(node.id),
        title: Row(
          children: [
            Checkbox(
              value: node.checked,
              onChanged: (v) => _onNodeChecked(node, v),
            ),
            Expanded(
              child: Text(
                node.title,
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        children: node.children.map(_buildTile).toList(),
      ),
    );
  }

  void _showDeleteDialog(TreeNode node) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Delete "${node.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteNode(node.id);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

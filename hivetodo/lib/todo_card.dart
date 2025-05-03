import 'package:flutter/material.dart';
import '../todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggleComplete;
  final VoidCallback onDelete;

  const TodoCard({
    Key? key,
    required this.todo,
    required this.onToggleComplete,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
return Container(
  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  height: 90,
  decoration: BoxDecoration(
    color: Colors.white,  // Background color
    borderRadius: BorderRadius.circular(12),  // Rounded corners
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        offset: Offset(0, 2),
        blurRadius: 6,
      ),
    ],
  ),
  child: ListTile(
    title: Text(
      todo.content,
      style: TextStyle(
        decoration: todo.isComplete ? TextDecoration.lineThrough : null,
      ),
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            todo.isComplete
                ? Icons.check_box
                : Icons.check_box_outline_blank,
            color: Colors.green,
          ),
          onPressed: onToggleComplete,
        ),
        IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ],
    ),
  ),
);
  }
}
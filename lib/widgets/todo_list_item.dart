import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lista_de_tarefas/models/task.dart';

class TodoListItem extends StatefulWidget {
  const TodoListItem({super.key, required this.task, required this.onDelete});

  final Task task;
  final Function(Task) onDelete;

  @override
  State<TodoListItem> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat(
                    'dd/MM/yyyy  - HH:mm',
                  ).format(widget.task.dateTime),
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  widget.task.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              widget.onDelete(widget.task);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.all(12),
              shape: CircleBorder(),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.delete, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

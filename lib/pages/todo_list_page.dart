import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/models/task.dart';
import 'package:lista_de_tarefas/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController taskController = TextEditingController();

  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: taskController,
                        decoration: InputDecoration(
                          labelText: 'Adicione uma tarefa',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        String text = taskController.text;
                        setState(() {
                          Task newTask = Task(
                            title: text,
                            dateTime: DateTime.now(),
                          );
                          tasks.add(newTask);
                          taskController.clear();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0000FF),
                        padding: EdgeInsets.all(20),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 24),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Task task in tasks)
                        TodoListItem(task: task, onDelete: onDelete),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Você possui ${tasks.length} tarefas pendentes',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0000FF),
                        padding: EdgeInsets.all(20),
                      ),
                      child: Text(
                        'Limpar tudo',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelete(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }
}

import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({super.key});

  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de tarefas')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _taskController,
                decoration: InputDecoration(
                  labelText: 'Digite uma tarefa',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () => login(_taskController),
                child: Text('Adicionar tarefa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void login(dynamic _taskController) {
  String text = _taskController.text;
  print(text);
  _taskController.clear();
}

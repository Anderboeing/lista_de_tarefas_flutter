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
                onChanged: (value) => onChanged(value),
                onSubmitted: (value) => login(_taskController),
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

void login(dynamic taskController) {
  String text = taskController.text;
  print(text);
  taskController.clear();
}

void onChanged(String value) {
  // somente leitura do valor digitado no TextField, sem alterar o estado do widget
  print('Texto digitado: $value');
}

void onSubmitted(String value) {
  // somente leitura do valor digitado no TextField, sem alterar o estado do widget
  print('Texto enviado: $value');
}

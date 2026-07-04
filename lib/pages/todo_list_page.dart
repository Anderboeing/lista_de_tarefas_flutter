import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: Text('Lista de tarefas')),
      body: Center(child: Text('Bem-vindo à lista de tarefas!')),
    );
  }
}

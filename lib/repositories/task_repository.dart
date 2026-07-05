import 'dart:convert';

import 'package:lista_de_tarefas/models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskRepository {
  TaskRepository() {
    SharedPreferences.getInstance().then((value) => sharedPreferences = value);
  }

  late SharedPreferences sharedPreferences;

  void saveTaskList(List<Task> tasks) {
    final String taskListJson = json.encode(
      tasks.map((task) => task.toJson()).toList(),
    );
    sharedPreferences.setString('task_list', taskListJson);
  }
}

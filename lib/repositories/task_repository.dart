import 'dart:convert';

import 'package:lista_de_tarefas/models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String taskListKey = 'task_list';

class TaskRepository {
  late SharedPreferences sharedPreferences;

  Future<List<Task>> getTaskList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String taskListJson =
        sharedPreferences.getString(taskListKey) ?? '[]';
    final List<dynamic> taskListMap = json.decode(taskListJson);
    final List<Task> taskList = taskListMap
        .map(
          (taskMap) => Task(
            title: taskMap['title'],
            dateTime: DateTime.parse(taskMap['dateTime']),
          ),
        )
        .toList();
    // Do something with the retrieved task list
    return taskList;
  }

  void saveTaskList(List<Task> tasks) {
    final String taskListJson = json.encode(
      tasks.map((task) => task.toJson()).toList(),
    );
    sharedPreferences.setString(taskListKey, taskListJson);
  }
}

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/task_model.dart';

class TaskController extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title, String description) {
    _tasks.add(Task(title: title, description: description));
    saveTasks();
    notifyListeners(); // notifies consumers
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    saveTasks();
    notifyListeners();
  }

  void updateTask(int index, String newTitle, String newDescription) {
    _tasks[index].title = newTitle;
    _tasks[index].description = newDescription;
    saveTasks();
    notifyListeners();
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList('tasks');
    if (stored != null) {
      _tasks = stored.map((e) => Task.fromJson(jsonDecode(e))).toList();
    }
    notifyListeners();
  }

  void saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = _tasks.map((e) => jsonEncode(e.toJson())).toList();
    prefs.setStringList('tasks', encoded);
  }
}

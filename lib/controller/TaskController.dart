import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/taskModel.dart';
import '../services/database/task_dao.dart';

class TaskController extends GetxController {
  final TaskDao taskDao = TaskDao();
  RxList<TaskModel> tasks = <TaskModel>[].obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  @override
  void onInit() {
    loadTasks();
    super.onInit();
  }

  Future<void> loadTasks() async {
    final data = await taskDao.getAllTasks();
    tasks.assignAll(data);
  }

  List<TaskModel> get pendingTasks => tasks.where((t) => t.isCompleted != 1).toList();

  List<TaskModel> get completedTasks => tasks.where((t) => t.isCompleted == 1).toList();

  Future<void> addTask(TaskModel task) async {
    await taskDao.insertTask(task);
    loadTasks();
  }

  Future<void> updateTask(TaskModel task) async {
    await taskDao.updateTask(task);
    loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await taskDao.deleteTask(id);
    loadTasks();
  }

  void filterTasksByDate(DateTime date) {
    final filtered = tasks.where((task) {
      return DateUtils.isSameDay(task.scheduledAt, date);
    }).toList();
    tasks.assignAll(filtered);
  }

  void changeSelectedDate(DateTime date) async{
    selectedDate.value = date;
    tasks.value = await taskDao.getTasksByDate(date);
  }

  Future<void> toggleComplete(TaskModel task, bool isChecked) async {
    final newStatus = isChecked ? 1 : 0;

    await taskDao.markCompleted(task.id!, newStatus);

    int index = tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      tasks[index].isCompleted = newStatus;
      tasks.refresh();
    }
  }


}

import '../../model/taskModel.dart';
import 'db_service.dart';


class TaskDao {
  final table = "tasks";

  Future<int> insertTask(TaskModel task) async {
    final db = await DBService().database;
    return await db.insert(table, task.toJson());
  }

  Future<List<TaskModel>> getAllTasks() async {
    final db = await DBService().database;
    final res = await db.query(table, orderBy: "id DESC");

    return res.isNotEmpty
        ? res.map((e) => TaskModel.fromJson(e)).toList()
        : [];
  }

  Future<int> updateTask(TaskModel task) async {
    final db = await DBService().database;
    return await db.update(
      table,
      task.toJson(),
      where: "id = ?",
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await DBService().database;
    return await db.delete(
      table,
      where: "id = ?",
      whereArgs: [id],
    );
  }



  Future<int> markCompleted(int id, int status) async {
    final db = await DBService().database;
    return await db.update(
      table,
      {'isCompleted': status},
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<List<TaskModel>> getTasksByDate(DateTime date) async {
    final db = await DBService().database;

    final dateString = date.toIso8601String().substring(0, 10);

    final res = await db.query(
      table,
      where: "DATE(scheduledAt) = ?",
      whereArgs: [dateString],
      orderBy: "scheduledAt ASC",
    );

    return res.isNotEmpty
        ? res.map((e) => TaskModel.fromJson(e)).toList()
        : [];
  }

}

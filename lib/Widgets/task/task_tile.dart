import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/Widgets/Text/FontText.dart';
import 'package:uptodo/app/theam/AppColors.dart';
import '../../controller/TaskController.dart';
import '../../model/taskModel.dart';
import '../Formatting/FormatedDate.dart';
import '../Formatting/FormatedTime.dart';

  Widget TaskTileContent(BuildContext context, TaskModel task) {
    final TaskController controller = Get.find<TaskController>();

    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: Checkbox(
          value: (task.isCompleted == 1),
            onChanged: (value) {
              controller.toggleComplete(task, value!);
            },
            activeColor: AppColor.primaryColor,


        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: FontText(
              context: context,
              text: task.title!,
            decoration: (task.isCompleted == 1) ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: FontText(
                context: context,
                text: task.description ?? "",
                fontSize: 14,
                decoration: (task.isCompleted == 1) ? TextDecoration.lineThrough : null,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                FontText(
                    context: context,
                    text: "Dated:",
                    fontSize: 12
                ),
                SizedBox(width: 5),
                DateText(date: task.scheduledAt!, style: TextStyle(fontSize: 12),),
                SizedBox(width: 10),
                TimeText(date: task.scheduledAt!, style: TextStyle(fontSize: 12),),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton(
          itemBuilder: (_) => [
            const PopupMenuItem(value: 'edit', child: Text("Edit")),
            const PopupMenuItem(value: 'delete', child: Text("Delete")),
          ],
          onSelected: (value) {
            if (value == "edit") {
              Get.toNamed("/edittodo", arguments: task);
            } else if (value == "delete") {
              controller.deleteTask(task.id!);
            }
          },
        ),
      ),
    );
  }


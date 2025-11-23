import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/Widgets/Text/FontText.dart';
import 'package:uptodo/app/theam/AppColors.dart';
import '../../Widgets/task/task_tile.dart';
import '../../app/routes/Routes.dart';
import '../../controller/AuthController.dart';
import '../../controller/TaskController.dart';


class Todolistscreen extends StatefulWidget {
  const Todolistscreen({super.key});

  @override
  State<Todolistscreen> createState() => _TodolistscreenState();
}

class _TodolistscreenState extends State<Todolistscreen> {
  @override
  Widget build(BuildContext context) {
    final TaskController taskC = Get.find<TaskController>();
    final AuthController authC = Get.find<AuthController>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: FontText(context: context, text: 'Your Tasks', color: AppColor.LighttextColor),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: authC.logout,
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: "To-Do"),
              Tab(text: "Completed"),
            ],
          ),
        ),
        body:Obx(() {
          return TabBarView(
            children: [
              taskC.pendingTasks.isEmpty
                  ? const Center(child: Text("No pending tasks"))
                  : ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: taskC.pendingTasks.length,
                itemBuilder: (_, i) =>
                    TaskTileContent(context, taskC.pendingTasks[i]),
              ),

              taskC.completedTasks.isEmpty
                  ? const Center(child: Text("No completed tasks"))
                  : ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: taskC.completedTasks.length,
                itemBuilder: (_, i) =>
                    TaskTileContent(context, taskC.completedTasks[i]),
              ),
            ],
          );
        }),

        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.addtodo),
          child: const Icon(Icons.add),
        ),
      ),
    );



  }
}


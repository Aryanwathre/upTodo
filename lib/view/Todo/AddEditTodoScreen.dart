import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../Widgets/Button/ColoredFilledButton.dart';
import '../../Widgets/textfields/input_field.dart';
import '../../controller/TaskController.dart';
import '../../model/taskModel.dart';

class AddEditTodoScreen extends StatefulWidget {
  const AddEditTodoScreen({super.key});

  @override
  State<AddEditTodoScreen> createState() => _AddEditTodoScreenState();
}

class _AddEditTodoScreenState extends State<AddEditTodoScreen> {
  late TextEditingController titleCtrl;
  late TextEditingController descCtrl;
  late TextEditingController dateCtrl;
  late TextEditingController timeCtrl;

  DateTime? selectedDateTime;

  TaskModel? editingTask;

  @override
  void initState() {
    super.initState();

    editingTask = Get.arguments as TaskModel?;

    titleCtrl = TextEditingController(text: editingTask?.title ?? "");
    descCtrl = TextEditingController(text: editingTask?.description ?? "");

    selectedDateTime = editingTask?.scheduledAt;

    dateCtrl = TextEditingController(
      text: selectedDateTime != null
          ? DateFormat('yyyy-MM-dd').format(selectedDateTime!)
          : "",
    );

    timeCtrl = TextEditingController(
      text: selectedDateTime != null
          ? DateFormat('hh:mm a').format(selectedDateTime!)
          : "",
    );
  }

  Future<void> pickDate() async {
    DateTime now = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDateTime = DateTime(
        picked.year,
        picked.month,
        picked.day,
        selectedDateTime?.hour ?? 0,
        selectedDateTime?.minute ?? 0,
      );

      dateCtrl.text = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {});
    }
  }

  Future<void> pickTime() async {
    final TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (picked != null) {
      selectedDateTime = DateTime(
        selectedDateTime?.year ?? DateTime.now().year,
        selectedDateTime?.month ?? DateTime.now().month,
        selectedDateTime?.day ?? DateTime.now().day,
        picked.hour,
        picked.minute,
      );

      final dt = DateTime(0, 1, 1, picked.hour, picked.minute);
      timeCtrl.text = DateFormat('hh:mm a').format(dt);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final TaskController controller = Get.find<TaskController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(editingTask == null ? "Add Task" : "Edit Task"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppTextField(
              label: "Title",
              controller: titleCtrl,
            ),
            const SizedBox(height: 16),

            AppTextField(
              label: "Description",
              controller: descCtrl,
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: pickDate,
              child: AbsorbPointer(
                child: AppTextField(
                  label: "Select Date",
                  controller: dateCtrl,
                ),
              ),
            ),
            const SizedBox(height: 16),

            GestureDetector(
              onTap: pickTime,
              child: AbsorbPointer(
                child: AppTextField(
                  label: "Select Time",
                  controller: timeCtrl,
                ),
              ),
            ),
            const SizedBox(height: 24),

            FilledButtonWidget(
              text: editingTask == null ? "Add Task" : "Update Task",
              context: context,
              onPressed: () {
                final title = titleCtrl.text.trim();
                final desc = descCtrl.text.trim();

                if (title.isEmpty) {
                  Get.snackbar("Error", "Title cannot be empty");
                  return;
                }

                if (selectedDateTime == null) {
                  Get.snackbar("Error", "Please select a date and time");
                  return;
                }

                if (editingTask == null) {
                  controller.addTask(
                    TaskModel(
                      title: title,
                      description: desc,
                      isCompleted: 0,
                      createdAt: DateTime.now(),
                      updatedAt: DateTime.now(),
                      scheduledAt: selectedDateTime,
                    ),
                  );
                } else {
                  controller.updateTask(
                    TaskModel(
                      id: editingTask!.id,
                      title: title,
                      description: desc,
                      isCompleted: editingTask!.isCompleted,
                      createdAt: editingTask!.createdAt,
                      updatedAt: DateTime.now(),
                      scheduledAt: selectedDateTime,
                    ),
                  );
                }

                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}

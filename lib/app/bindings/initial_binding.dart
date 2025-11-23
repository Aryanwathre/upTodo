import 'package:get/get.dart';
import '../../controller/AuthController.dart';
import '../../controller/TaskController.dart';
import '../../services/database/db_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DBService>(DBService(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<TaskController>(TaskController(), permanent: true);
  }
}

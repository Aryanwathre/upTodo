import 'package:get/get.dart';
import '../../view/Auth/LoginScreen.dart';
import '../../view/Auth/RegisterScreen.dart';
import '../../view/Intro/SplashScreen.dart';
import '../../view/Todo/AddEditTodoScreen.dart';
import '../../view/Todo/TodoListScreen.dart';

class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String todoList = '/todoList';
  static const String addtodo = '/addtodo';
  static const String edittodo = '/edittodo';
  static const String settings = '/settings';

  static const initial = splash;

  static final pages = [

    GetPage(
      name: splash,
      page: () => const SplashScreenPage(),
    ),
    GetPage(
      name: login,
      page: () => const LoginView(),
    ),
    GetPage(
      name: register,
      page: () => const SignupView(),
    ),
    GetPage(
      name: todoList,
      page: () => const Todolistscreen(),
    ),
    GetPage(
      name: addtodo,
      page: () => const AddEditTodoScreen(),
    ),
    GetPage(
      name: edittodo,
      page: () => const AddEditTodoScreen(),
    ),
  ];
}

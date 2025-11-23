import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/services/database/db_service.dart';

import 'app/bindings/initial_binding.dart';
import 'app/routes/Routes.dart';
import 'app/theam/theams.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DBService().database;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'UpTodo',
      theme: AppTheme.lightTheme,
      defaultTransition: Transition.fadeIn,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      getPages: Routes.pages,
      initialBinding: InitialBinding(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmanagement_app_provider/View/splash_screen.dart';

import 'Controller/task_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskController()..loadTasks(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'provider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreen(),
    );
  }
}

import 'package:demo_project/dashboard/student_dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter framework is initialized
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shiksha Sutram',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StudentDashboard(),
    );
  }
}

import 'package:day_3/components/stepper_form.dart';
import 'package:day_3/models/project.dart';
import 'package:day_3/pages/dashboards/client_dashboard.dart';
import 'package:day_3/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: LoginPage(),
    );
  }
}

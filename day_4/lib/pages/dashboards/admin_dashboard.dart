import 'package:day_4/models/project.dart';
import 'package:day_4/pages/create_project_page.dart';
import 'package:day_4/pages/create_project_stepper.dart';
import 'package:day_4/pages/project_page.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to the dashboard Mr Admin"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        CreateProjectStepperPage(),
                  ),
                );
              },
              child: Text("Create Project"),
            ),
          ],
        ),
      ),
    );
  }
}

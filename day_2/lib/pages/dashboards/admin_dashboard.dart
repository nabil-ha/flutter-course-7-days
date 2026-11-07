import 'package:day_2/models/project.dart';
import 'package:day_2/pages/project_page.dart';
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
          children: [
            Text("Welcome to the dashboard Mr Admin"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ProjectPage(project: projects[0]),
                  ),
                );
              },
              child: Text("Go to project"),
            ),
          ],
        ),
      ),
    );
  }
}

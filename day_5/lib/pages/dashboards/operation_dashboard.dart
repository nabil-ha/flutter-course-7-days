import 'package:day_5/models/project.dart';
import 'package:day_5/pages/project_page.dart';
import 'package:flutter/material.dart';

class OperationDashboard extends StatefulWidget {
  const OperationDashboard({super.key});

  @override
  State<OperationDashboard> createState() => _OperationDashboardState();
}

class _OperationDashboardState extends State<OperationDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Operation Dashboard")),
      body: Center(
        child: Column(
          children: [
            Text("Welcome to the dashboard Mr Operation"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProjectPage(),
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

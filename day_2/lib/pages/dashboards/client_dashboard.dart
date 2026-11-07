import 'package:day_2/models/project.dart';
import 'package:day_2/pages/project_page.dart';
import 'package:flutter/material.dart';

class ClientDashboard extends StatefulWidget {
  const ClientDashboard({super.key});

  @override
  State<ClientDashboard> createState() => _ClientDashboardState();
}

class _ClientDashboardState extends State<ClientDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Client Dashboard")),
      body: Center(
        child: Column(
          children: [
            Text("Welcome to the dashboard Mr Client"),
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

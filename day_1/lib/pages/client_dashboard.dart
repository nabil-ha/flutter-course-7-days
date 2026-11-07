import 'package:day_1/models/project.dart';
import 'package:flutter/material.dart';

class ClientDashboard extends StatefulWidget {
  final Project project;
  const ClientDashboard({super.key, required this.project});

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
            Text("Name: " + widget.project.name),
            Text("Company Name: " + widget.project.companyName),
            Text("Project Status: " + widget.project.status.name),
            const SizedBox(height: 30),
            if (widget.project.status != ProjectStatus.finished &&
                widget.project.status != ProjectStatus.in_progress)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.project.status = ProjectStatus.pending;
                  });
                },
                child: Text("Set status to pending"),
              ),
            if (widget.project.status != ProjectStatus.finished)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.project.status = ProjectStatus.in_progress;
                  });
                },
                child: Text("Set status to in_progress"),
              ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.project.status = ProjectStatus.finished;
                });
              },
              child: Text("Set status to finished"),
            ),
          ],
        ),
      ),
    );
  }
}

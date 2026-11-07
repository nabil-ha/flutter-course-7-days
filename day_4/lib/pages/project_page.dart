import 'package:day_4/models/project.dart';
import 'package:day_4/providers/project_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(title: Text("Project")),
        body: Center(
          child: Column(
            children: [
              Text("Name: " + value.project!.name),
              Text("Company Name: " + value.project!.client.clientCompanyName),
              Text("Project Status: " + value.project!.status.name),
              const SizedBox(height: 30),

              // if (widget.project.status != ProjectStatus.finished &&
              //     widget.project.status != ProjectStatus.in_progress)
              // ElevatedButton(
              //   onPressed: () {
              //     widget.project.status = ProjectStatus.pending;
              //     setState(() {});
              //   },
              //   child: Text("Set status to pending"),
              // ),
              // // if (widget.project.status != ProjectStatus.finished)
              // ElevatedButton(
              //   onPressed: () {
              //     setState(() {
              //       widget.project.status = ProjectStatus.in_progress;
              //     });
              //   },
              //   child: Text("Set status to in_progress"),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     setState(() {
              //       widget.project.status = ProjectStatus.finished;
              //     });
              //   },
              //   child: Text("Set status to finished"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

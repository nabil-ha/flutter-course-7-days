import 'package:day_2/models/project.dart';
import 'package:flutter/material.dart';

class ProjectPage extends StatelessWidget {
  final Project project;
  const ProjectPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Project")),
      body: Center(
        child: Column(
          children: [
            Text("Name: " + project.name),
            Text("Company Name: " + project.companyName),

            Text("Project Status: " + project.status.name),
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
    );
  }
}

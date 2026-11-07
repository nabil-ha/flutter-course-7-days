import 'package:day_5/models/project.dart';
import 'package:flutter/material.dart';

// ---- Day 6, Bullet Point 8: Progress indicators ----
class WorkflowStepper extends StatelessWidget {
  final Project project;

  const WorkflowStepper({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final steps = ProjectStatus.values;

    return Stepper(
      currentStep: steps.indexOf(project.status),
      controlsBuilder: (_, __) => const SizedBox(),
      steps: steps.map((status) {
        return Step(
          title: Text(status.name),
          content: const SizedBox(),
          isActive: project.status.index >= status.index,
        );
      }).toList(),
    );
  }
}

// ---- End Day 6 ----

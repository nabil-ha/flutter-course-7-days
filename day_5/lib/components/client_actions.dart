import 'package:day_5/models/project.dart';
import 'package:day_5/providers/project_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ---- Day 6, Bullet Point 5: Client decision flow ----
class ClientActionsPanel extends StatelessWidget {
  final Project project;

  const ClientActionsPanel({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<ProjectProvider>().approveQuotation(project);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Quotation approved")));
            },
            child: const Text("Accept"),
          ),
          SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              context.read<ProjectProvider>().rejectQuotation(project);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Quotation rejected")));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Reject"),
          ),
        ],
      ),
    );
  }
}

// ---- End Day 6 ----

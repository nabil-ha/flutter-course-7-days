import 'package:day_6/pages/create_project_stepper.dart';
import 'package:day_6/pages/project_page.dart';
import 'package:day_6/providers/project_provider.dart';
import 'package:day_6/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<UserProvider, ProjectProvider>(
      builder: (context, userProvider, projectProvider, child) => Scaffold(
        appBar: AppBar(title: const Text("Dashboard")),
        body: Column(
          children: [
            // Welcome header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Welcome ${userProvider.userRole!.name}",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            // Projects list
            Expanded(
              child: projectProvider.projects.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("No projects yet"),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateProjectStepperPage(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add),
                            label: const Text("Create First Project"),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: projectProvider.projects.length,
                      itemBuilder: (context, index) {
                        final project = projectProvider.projects[index];
                        return GestureDetector(
                          onTap: () {
                            // Select the project and navigate to details
                            projectProvider.selectProject(project);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProjectPage(),
                              ),
                            );
                          },
                          child: ProjectCard(
                            projectName: project.name,
                            clientName: project.client.clientCompanyName,
                            status: project.status.name,
                            startDate: project.startDate,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateProjectStepperPage(),
              ),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text("Create Project"),
        ),
      ),
    );
  }
}

/// Project Card Widget
class ProjectCard extends StatelessWidget {
  final String projectName;
  final String clientName;
  final String status;
  final DateTime startDate;

  const ProjectCard({
    super.key,
    required this.projectName,
    required this.clientName,
    required this.status,
    required this.startDate,
  });

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.orange;
      case 'quoted':
        return Colors.blue;
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      case 'inProduction':
        return Colors.purple;
      case 'delivered':
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    projectName,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(status),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              "Client: $clientName",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              "Started: ${startDate.year}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

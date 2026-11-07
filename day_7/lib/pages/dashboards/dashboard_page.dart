import 'package:day_7/extensions.dart';
import 'package:day_7/models/project.dart';
import 'package:day_7/pages/create_project_stepper.dart';
import 'package:day_7/pages/project_page.dart';
import 'package:day_7/providers/project_provider.dart';
import 'package:day_7/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String getRoleByName(String role, BuildContext context) {
    switch (role) {
      case "Admin":
        return context.loc.admin;
      case "Partner":
        return context.loc.partner;
      case "Operation":
        return context.loc.operation;
      case "Client":
        return context.loc.client;
      default:
        return context.loc.client;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserProvider, ProjectProvider>(
      builder: (context, userProvider, projectProvider, child) => Scaffold(
        appBar: AppBar(title: Text(context.loc.dashboard)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${context.loc.welcomeToDashboardMr} ${getRoleByName(userProvider.userRole!.name, context)}",
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          CreateProjectStepperPage(),
                    ),
                  );
                },
                child: Text(context.loc.createProject),
              ),
              projectProvider.projects.isEmpty
                  ? Text("No projects yet")
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: projectProvider.projects.length,
                      itemBuilder: (context, index) {
                        Project project = projectProvider.projects[index];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProjectPage(projectName: project.name),
                            ),
                          ),
                          child: Card(
                            margin: EdgeInsets.all(16),
                            elevation: 10,
                            // shape: BeveledRectangleBorder(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    project.name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.apartment,
                                            color: Colors.black,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            project.client.clientCompanyName,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.build,
                                            color: Colors.black,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            project.status
                                                .toString()
                                                .split('.')[1]
                                                .toUpperCase(),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

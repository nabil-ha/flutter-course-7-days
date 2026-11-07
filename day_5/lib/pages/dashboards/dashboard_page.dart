import 'package:day_5/models/project.dart';
import 'package:day_5/pages/create_project_page.dart';
import 'package:day_5/pages/create_project_stepper.dart';
import 'package:day_5/pages/project_page.dart';
import 'package:day_5/providers/user_provider.dart';
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
    return Consumer<UserProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(title: Text("Dashboard")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to the dashboard Mr ${value.userRole!.name}"),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          CreateProjectStepperPage(),
                    ),
                  );
                },
                child: Text("Create Project"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

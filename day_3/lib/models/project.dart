import 'package:day_3/models/client.dart';

enum ProjectStatus { pending, in_progress, finished }

class Project {
  String name;
  Client client; // This is for client info
  ProjectStatus status; // pending
  List<String>? requirements; // empty
  DateTime startDate;
  DateTime? endDate;
  Project({
    required this.name,
    required this.client,
    required this.status,
    required this.startDate,
    this.endDate,
    this.requirements,
  });
}

List<Project> projects = [
  Project(
    name: "New project",
    client: Client(
      clientCompanyName: "Company name",
      clientContactEmail: "nabil_ha@yahoo.com",
    ),
    startDate: DateTime.now(),
    status: ProjectStatus.pending,
  ),
  Project(
    name: "Hajj Project",
    client: Client(
      clientCompanyName: "Company name",
      clientContactEmail: "nabil_ha@yahoo.com",
    ),
    startDate: DateTime.now(),
    status: ProjectStatus.finished,
  ),
];

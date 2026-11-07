import 'client.dart';

// ---- Day 6, Bullet Point 1: Workflow states using enums ----
enum ProjectStatus {
  created,
  quoted,
  approved,
  inProduction,
  readyForDelivery,
  completed,
}
// ---- End Day 6 ----

class Project {
  String id;
  String name;
  Client client; // This is for client info
  ProjectStatus status;
  List<String>? requirements;
  DateTime startDate;
  DateTime? endDate;
  DateTime? deliveryDate;
  double? price;
  String? notes;

  Project({
    required this.id,
    required this.name,
    required this.client,
    required this.status,
    required this.startDate,
    this.endDate,
    this.requirements,
    this.deliveryDate,
    this.price,
    this.notes,
  });
}

List<Project> projects = [
  Project(
    id: "1",
    name: "New project",
    client: Client(
      clientCompanyName: "Company name",
      clientContactEmail: "nabil_ha@yahoo.com",
    ),
    startDate: DateTime.now(),
    status: ProjectStatus.created,
  ),
  Project(
    id: "2",
    name: "Hajj Project",
    client: Client(
      clientCompanyName: "Company name",
      clientContactEmail: "nabil_ha@yahoo.com",
    ),
    startDate: DateTime.now(),
    status: ProjectStatus.completed,
  ),
];

enum ProjectStatus { pending, in_progress, finished }

class Project {
  String name;
  String companyName;
  List<String>? requests;
  String? contactEmail;
  String? CR;
  ProjectStatus status;
  Project({
    required this.name,
    required this.companyName,
    required this.status,
    this.requests,
    this.contactEmail,
    this.CR,
  });
}

List<Project> projects = [
  Project(
    companyName: "Alfawaaed",
    name: "New project",
    status: ProjectStatus.pending,
  ),
  Project(
    companyName: "Kidana",
    name: "Hajj Project",
    status: ProjectStatus.finished,
  ),
];

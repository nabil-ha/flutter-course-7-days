import 'package:day_5/models/project.dart';
import 'package:flutter/material.dart';

class ProjectProvider extends ChangeNotifier {
  Project? _project;
  Project? get project => _project;

  setProject(Project project) {
    _project = project;
    notifyListeners();
  }

  // ---- Day 6, Bullet Point 2: Status transition rules ----
  bool canTransition(ProjectStatus current, ProjectStatus next) {
    const transitions = {
      ProjectStatus.created: [ProjectStatus.quoted],
      ProjectStatus.quoted: [ProjectStatus.approved],
      ProjectStatus.approved: [ProjectStatus.inProduction],
      ProjectStatus.inProduction: [ProjectStatus.readyForDelivery],
      ProjectStatus.readyForDelivery: [ProjectStatus.completed],
    };

    return transitions[current]?.contains(next) ?? false;
  }

  void updateStatus(ProjectStatus newStatus) {
    if (_project == null) return;
    if (!canTransition(_project!.status, newStatus)) return;

    _project!.status = newStatus;
    notifyListeners();
  }
  // ---- End Day 6 ----

  // ---- Day 6, Bullet Point 4: Sales quotation submission flow ----
  Future<void> submitQuotation(
    Project project, {
    required double price,
    String? notes,
  }) async {
    // TODO: Make API call to /projects/${project.id}/quotation
    // DioClient.post("/projects/${project.id}/quotation", {
    //   "price": price,
    //   "notes": notes,
    // });

    _project?.price = price;
    _project?.notes = notes;
    updateStatus(ProjectStatus.quoted);
  }
  // ---- End Day 6 ----

  // ---- Day 6, Bullet Point 5: Client decision flow ----
  Future<void> approveQuotation(Project project) async {
    // TODO: Make API call to /projects/${project.id}/approve
    // DioClient.put("/projects/${project.id}/approve");
    updateStatus(ProjectStatus.approved);
  }

  Future<void> rejectQuotation(Project project) async {
    // TODO: Make API call to /projects/${project.id}/reject
    // DioClient.put("/projects/${project.id}/reject");
  }
  // ---- End Day 6 ----

  // ---- Day 6, Bullet Point 7: Operations manufacturing updates ----
  Future<void> updateProductionProgress(Project project, int progress) async {
    // TODO: Make API call to /projects/${project.id}/production
    // DioClient.put("/projects/${project.id}/production", {"progress": progress});

    if (progress == 100) {
      updateStatus(ProjectStatus.readyForDelivery);
    }
  }
  // ---- End Day 6 ----

  // ---- Day 6, Bullet Point 9: Auto status checks / reminders ----
  bool shouldShowDeliveryReminder(Project project) {
    if (project.deliveryDate == null) return false;

    final daysLeft = project.deliveryDate!.difference(DateTime.now()).inDays;

    return daysLeft <= 5 && project.status == ProjectStatus.inProduction;
  }

  // ---- End Day 6 ----
}

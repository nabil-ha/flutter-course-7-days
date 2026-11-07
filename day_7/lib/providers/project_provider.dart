import 'package:day_7/models/approval_documents.dart';
import 'package:day_7/models/project.dart';
import 'package:day_7/models/quotation.dart';
import 'package:flutter/material.dart';

class ProjectProvider extends ChangeNotifier {
  List<Project> _projects = [];
  List<Project> get projects => _projects;
  // setProject(Project project) {
  //   _project = project;
  //   notifyListeners();
  // }

  createProject(Project project) {
    _projects.add(project);
    notifyListeners();
  }

  Project getProject(String projectName) {
    return projects.firstWhere((element) => element.name == projectName);
  }

  bool canTransition(ProjectStatus currentStatus, ProjectStatus newStatus) {
    if (currentStatus == ProjectStatus.pending &&
        newStatus == ProjectStatus.quoted) {
      return true;
    } else if (currentStatus == ProjectStatus.quoted &&
        (newStatus == ProjectStatus.approved ||
            newStatus == ProjectStatus.rejected)) {
      return true;
    } else if (currentStatus == ProjectStatus.approved &&
        newStatus == ProjectStatus.inProduction) {
      return true;
    } else if (currentStatus == ProjectStatus.inProduction &&
        newStatus == ProjectStatus.delivered) {
      return true;
    } else {
      return false;
    }
  }

  // Make status = quoted
  void createQuotation(String projectName, Quotation quotation) {
    if (_projects.isNotEmpty) {
      Project project = _projects.firstWhere(
        (project) => project.name == projectName,
      );
      project.quotation = quotation;
      bool ok = canTransition(project.status, ProjectStatus.quoted);
      if (ok) {
        project.status = ProjectStatus.quoted;
      }

      notifyListeners();
    }
  }

  // Make status approved
  void approveQuotation(
    String projectName,
    ApprovalDocuments approvalDocuments,
  ) {
    Project project = projects.firstWhere(
      (element) => element.name == projectName,
    );
    bool ok = canTransition(project.status, ProjectStatus.approved);
    if (ok) {
      project.approvalDocuments = approvalDocuments;
      project.status = ProjectStatus.approved;
    }
    notifyListeners();
  }

  // Make status rejected
  void rejectQuotation(String projectName) {
    Project project = projects.firstWhere(
      (element) => element.name == projectName,
    );
    bool ok = canTransition(project.status, ProjectStatus.rejected);
    if (ok) {
      project.status = ProjectStatus.rejected;
    }
    notifyListeners();
  }

  // Make status inProduction
  void moveToProduction(String projectName) {
    Project project = projects.firstWhere(
      (element) => element.name == projectName,
    );
    bool ok = canTransition(project.status, ProjectStatus.inProduction);
    if (ok) {
      project.status = ProjectStatus.inProduction;
    }
    notifyListeners();
  }

  // Make status delivered
  void markAsDelivered(String projectName) {
    Project project = projects.firstWhere(
      (element) => element.name == projectName,
    );
    bool ok = canTransition(project.status, ProjectStatus.delivered);
    if (ok) {
      project.status = ProjectStatus.delivered;
    }
    notifyListeners();
  }
}

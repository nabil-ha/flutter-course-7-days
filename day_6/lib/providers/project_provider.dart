import 'package:day_6/models/approval_documents.dart';
import 'package:day_6/models/project.dart';
import 'package:day_6/models/quotation.dart';
import 'package:flutter/material.dart';

class ProjectProvider extends ChangeNotifier {
  List<Project> _projects = [];
  Project? _selectedProject;

  List<Project> get projects => _projects;
  Project? get project => _selectedProject;

  /// Add a new project to the list
  void addProject(Project project) {
    _projects.add(project);
    _selectedProject = project;
    notifyListeners();
  }

  /// Select a project from the list
  void selectProject(Project project) {
    _selectedProject = project;
    notifyListeners();
  }

  /// Set a project (for backward compatibility)
  void setProject(Project project) {
    _selectedProject = project;
    notifyListeners();
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
  void createQuotation(Quotation quotation) {
    if (_selectedProject != null) {
      _selectedProject!.quotation = quotation;
      bool ok = canTransition(_selectedProject!.status, ProjectStatus.quoted);
      if (ok) {
        _selectedProject!.status = ProjectStatus.quoted;
      }

      notifyListeners();
    }
  }

  // Make status approved
  void approveQuotation(ApprovalDocuments approvalDocuments) {
    if (_selectedProject != null) {
      bool ok = canTransition(_selectedProject!.status, ProjectStatus.approved);
      if (ok) {
        _selectedProject!.approvalDocuments = approvalDocuments;
        _selectedProject!.status = ProjectStatus.approved;
      }
      notifyListeners();
    }
  }

  // Make status rejected
  void rejectQuotation() {
    if (_selectedProject != null) {
      bool ok = canTransition(_selectedProject!.status, ProjectStatus.rejected);
      if (ok) {
        _selectedProject!.status = ProjectStatus.rejected;
      }
      notifyListeners();
    }
  }

  // Make status inProduction
  void moveToProduction() {
    if (_selectedProject != null) {
      bool ok = canTransition(
        _selectedProject!.status,
        ProjectStatus.inProduction,
      );
      if (ok) {
        _selectedProject!.status = ProjectStatus.inProduction;
      }
      notifyListeners();
    }
  }

  // Make status delivered
  void markAsDelivered() {
    if (_selectedProject != null) {
      bool ok = canTransition(
        _selectedProject!.status,
        ProjectStatus.delivered,
      );
      if (ok) {
        _selectedProject!.status = ProjectStatus.delivered;
      }
      notifyListeners();
    }
  }
}

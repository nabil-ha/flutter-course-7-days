import 'package:day_4/models/project.dart';
import 'package:flutter/material.dart';

class ProjectProvider extends ChangeNotifier {
  Project? _project;
  Project? get project => _project;
  setProject(Project project) {
    _project = project;
    notifyListeners();
  }
}

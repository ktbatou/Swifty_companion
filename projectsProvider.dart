import 'package:flutter/material.dart';

class ProjectsProvider extends ChangeNotifier {
  List projects = [];
  List ParentProjects = [];

  get getProjects => projects;
  get getProjectsWParent => ParentProjects;

  setProject(var value) {
    projects = value;
    notifyListeners();
  }

  setProjectWparent(var val) {
    ParentProjects = val;
    notifyListeners();
  }
}

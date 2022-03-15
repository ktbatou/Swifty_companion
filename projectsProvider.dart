import 'package:flutter/material.dart';
import 'package:swifty_companion/projectSetter.dart';
import 'package:swifty_companion/projects.dart';

class ProjectsProvider extends ChangeNotifier {
  var projects = [];
  List ParentProjects = [];

  get getProjects => projects;
  get getProjectsWParent => ParentProjects;

  setProject(var value) {
    projects = value;

    notifyListeners();
  }
}

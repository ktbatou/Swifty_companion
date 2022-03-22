import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/CursusProvider.dart';
import 'package:swifty_companion/authCodeProvider.dart';
import 'package:swifty_companion/projectsProvider.dart';

projectsList(var context, var id) {
  final res = Provider.of<AuthCode>(context, listen: false).getData;
  var user = json.decode(res.body);
  List projects = user["projects_users"];
  var pjctList = {};
  var project_id;
  List pjctWparent = [];
  List<project> test = [];

  projects
      .map((e) => {
            project_id = e["project"]["id"],
            if (e["cursus_ids"][0] == id)
              {
                if (pjctList[project_id] == null &&
                    e["project"]["parent_id"].toString() == "null")
                  {
                    pjctList[project_id] = {
                      "parent": {
                        "clicked": false,
                        "name": "",
                        "id": "",
                        "final_mark": "",
                        "status": "",
                      },
                      "childs": []
                    },
                  }
              }
          })
      .toList();

  projects
      .map((value) => {
            project_id = value["project"]["id"],
            if (value["cursus_ids"][0] == id)
              {
                if (value["project"]["parent_id"].toString() == "null")
                  {
                    pjctList[project_id]["parent"]["name"] =
                        value["project"]["name"],
                    pjctList[project_id]["parent"]["id"] =
                        value["project"]["id"].toString(),
                    pjctList[project_id]["parent"]["final_mark"] =
                        value["final_mark"].toString(),
                    pjctList[project_id]["parent"]["status"] = value["status"],
                  }
                else if (value["project"]["parent_id"].toString() != "null")
                  {
                    pjctList[value["project"]["parent_id"]]["childs"].add({
                      "name": value["project"]["name"],
                      "id": value["project"]["parent_id"],
                      "final_mark": value["final_mark"],
                      "status": value["status"]
                    })
                  }
              }
          })
      .toList();
  var test1 = pjctList.entries.toList();

  pjctList.entries
      .map((e) => {
            print("${e.value["childs"]}"),
          })
      .toList();
  Provider.of<ProjectsProvider>(context, listen: false)
      .setProject(pjctList.entries.toList());
}

class project {
  String id;
  String name;
  String state;
  String grade;
  List childs;

  project(
      {this.id = "",
      this.name = "",
      this.grade = "",
      this.state = "",
      this.childs = const []});
}

filterProjects() {
  List<project> Projects = [];
}

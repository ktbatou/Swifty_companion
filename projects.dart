import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/CursusProvider.dart';
import 'package:swifty_companion/authCodeProvider.dart';
import 'package:swifty_companion/projectsProvider.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  projectsList(var context) {
    var id = Provider.of<CursusProvider>(context).getCususId;
    final res = Provider.of<AuthCode>(context, listen: false).getData;
    var user = json.decode(res.body);
    List projects = user["projects_users"];
    List pjctList = [];
    List pjctWParent = [];
    projects
        .map((value) => {
              if (value["cursus_ids"][0] == id) pjctList.add(value),
            })
        .toList();
    pjctList
        .map((e) => {
              if (e["project"]["parent_id"] != null) pjctWParent.add(e),
            })
        .toList();
    pjctList.removeWhere((element) => element["project"]["parent_id"] != null);
    Provider.of<ProjectsProvider>(context).setProject(pjctList);
    Provider.of<ProjectsProvider>(context).setProjectWparent(pjctWParent);
  }

  @override
  Widget build(BuildContext context) {
    double contextheight = MediaQuery.of(context).size.height;
    projectsList(context);
    return Consumer<ProjectsProvider>(
      builder: (context, cart, child) {
        return Container(
            height: contextheight * 0.5,
            padding: EdgeInsets.only(left: 30, top: 10),
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // padding: EdgeInsets.only(left: 25),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                cart.projects[index]["project"]["name"],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: cart.projects.length));
      },
    );
  }
}

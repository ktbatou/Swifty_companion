import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/CursusProvider.dart';
import 'package:swifty_companion/authCodeProvider.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  projectsList(var context) {
    var id = Provider.of<CursusProvider>(context).getCususId;
    final res = Provider.of<AuthCode>(context, listen: false).getData;
    Map user = json.decode(res.body);
    var peojects;
    print(user["projects_users"][1]["cursus_ids"][0]);
  }

  @override
  Widget build(BuildContext context) {
    projectsList(context);
    return Container();
  }
}

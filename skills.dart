import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/CursusProvider.dart';
import 'package:swifty_companion/authCodeProvider.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    double contextheight = MediaQuery.of(context).size.height;
    double contextWidth = MediaQuery.of(context).size.width;
    final res = Provider.of<AuthCode>(context, listen: false).getData;
    var value = Provider.of<CursusProvider>(context).getCursus;
    var user = json.decode(res.body);
    return Container(
      padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: user["cursus_users"][value]["skills"].length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: contextWidth * 0.4,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        user["cursus_users"][value]["skills"][index]["name"],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      )),
                ),
                Container(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        user["cursus_users"][value]["skills"][index]["level"]
                            .toString(),
                        style:
                            const TextStyle(color: Colors.green, fontSize: 12),
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

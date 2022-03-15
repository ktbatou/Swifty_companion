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
  bool dropped = false;
  @override
  Widget build(BuildContext context) {
    double contextheight = MediaQuery.of(context).size.height;
    double contextWidth = MediaQuery.of(context).size.width;

    return Consumer<ProjectsProvider>(
      builder: (context, cart, child) {
        return Container(
            height: contextheight * 0.5,
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return cart.projects[index].value["childs"].length != 0
                      ? Container(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            dropped = !dropped;
                                            print(dropped);
                                          });
                                        },
                                        child: const Icon(
                                          Icons.arrow_drop_down_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        width: contextWidth * 0.2,
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              cart.projects[index]
                                                  .value["parent"]["name"],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            )),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: contextWidth * 0.2,
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          cart.projects[index].value["parent"]
                                              ["status"],
                                          style: TextStyle(
                                              color: cart.projects[index]
                                                              .value["parent"]
                                                          ["status"] ==
                                                      "finished"
                                                  ? Colors.grey.shade300
                                                  : Colors.red.shade300,
                                              fontSize: 12),
                                        )),
                                  ),
                                  Container(
                                    width: contextWidth * 0.2,
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          cart.projects[index].value["parent"]
                                                      ["final_mark"] ==
                                                  "null"
                                              ? "--"
                                              : cart.projects[index]
                                                      .value["parent"]
                                                  ["final_mark"],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        )),
                                  ),
                                ],
                              ),
                              dropped == true
                                  ? Container(
                                      color: Colors.grey.shade800,
                                      width: contextWidth * 0.8,
                                      height: contextheight * 0.3,
                                      child: ListView.separated(
                                          shrinkWrap: true,
                                          itemBuilder:
                                              (BuildContext context, int i) {
                                            return Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: contextWidth * 0.2,
                                                  child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        cart.projects[index]
                                                                .value["childs"]
                                                            [i]["name"],
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      )),
                                                ),
                                                Container(
                                                  width: contextWidth * 0.2,
                                                  child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        cart.projects[index]
                                                                .value["childs"]
                                                            [i]["status"],
                                                        style: TextStyle(
                                                            color: cart.projects[index].value[
                                                                            "childs"][i]
                                                                        [
                                                                        "status"] ==
                                                                    "finished"
                                                                ? Colors.grey
                                                                    .shade300
                                                                : Colors.red
                                                                    .shade300,
                                                            fontSize: 12),
                                                      )),
                                                ),
                                                Container(
                                                  width: contextWidth * 0.2,
                                                  child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        cart
                                                                    .projects[
                                                                        index]
                                                                    .value[
                                                                        "childs"]
                                                                        [i][
                                                                        "final_mark"]
                                                                    .toString() ==
                                                                "null"
                                                            ? "--"
                                                            : cart
                                                                .projects[index]
                                                                .value["childs"]
                                                                    [i][
                                                                    "final_mark"]
                                                                .toString(),
                                                        style: TextStyle(
                                                            color: cart
                                                                        .projects[
                                                                            index]
                                                                        .value[
                                                                            "childs"]
                                                                            [i][
                                                                            "final_mark"]
                                                                        .toString() ==
                                                                    "0"
                                                                ? Colors.red
                                                                : Colors.green,
                                                            fontSize: 10),
                                                      )),
                                                ),
                                              ],
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(
                                              height: 20,
                                            );
                                          },
                                          itemCount: cart.projects[index]
                                              .value["childs"].length),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: contextWidth * 0.2,
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    cart.projects[index].value["parent"]
                                        ["name"],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )),
                            ),
                            Container(
                              width: contextWidth * 0.2,
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    cart.projects[index].value["parent"]
                                        ["status"],
                                    style: TextStyle(
                                        color:
                                            cart.projects[index].value["parent"]
                                                        ["status"] ==
                                                    "finished"
                                                ? Colors.grey.shade400
                                                : Colors.red.shade300,
                                        fontSize: 12),
                                  )),
                            ),
                            Container(
                              width: contextWidth * 0.2,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    cart.projects[index]
                                                .value["parent"]["final_mark"]
                                                .toString() ==
                                            "null"
                                        ? "--"
                                        : cart.projects[index]
                                            .value["parent"]["final_mark"]
                                            .toString(),
                                    style: TextStyle(
                                        color: cart
                                                    .projects[index]
                                                    .value["parent"]
                                                        ["final_mark"]
                                                    .toString() ==
                                                "0"
                                            ? Colors.red
                                            : Colors.green,
                                        fontSize: 10),
                                  )),
                            ),
                          ],
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

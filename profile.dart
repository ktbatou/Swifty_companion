import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/ImageFutureBuilder.dart';
import 'package:swifty_companion/about.dart';
import 'package:swifty_companion/authCodeProvider.dart';
import 'package:swifty_companion/dropDownList.dart';
import 'package:swifty_companion/projects.dart';
import 'package:swifty_companion/search.dart';
import 'package:swifty_companion/searchResult.dart';
import 'package:swifty_companion/splash.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final res = Provider.of<AuthCode>(context, listen: false).getData;
    var user = json.decode(res.body);
    var img = user["image_url"];
    var flagUserCursus = true;
    if (user["cursus_users"].length == 0) flagUserCursus = false;
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgound.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: Center(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchResult()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color(0xff09D178),
                      ),
                    ),
                  ),
                  bottom: const TabBar(
                      indicatorColor: Color(0xff09D178),
                      unselectedLabelColor: Colors.grey,
                      labelStyle: TextStyle(fontSize: 12),
                      //  unselectedLabelStyle: Colors.grey,
                      labelColor: Color(0xff09D178),
                      tabs: [
                        Tab(
                          text: "About",
                          icon: Icon(
                            Icons.person,
                          ),
                        ),
                        Tab(
                          text: "Projects",
                          icon: Icon(Icons.reorder),
                        ),
                        Tab(
                          text: "Skills",
                          icon: Icon(Icons.equalizer),
                        )
                      ]),
                ),
                backgroundColor: Colors.black.withOpacity(0.79),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 20),
                                width: 50,
                                height: 50,
                                child: ImageGetter(img: img)),
                            Container(
                              // width: 100,
                              padding: EdgeInsets.only(left: 20),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    user["usual_full_name"],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  )),
                            ),
                          ],
                        ),
                        const CursusList(),
                      ],
                    ),
                    const Divider(
                      thickness: 0.5,
                      //  indent: 20,
                      //endIndent: 20,
                      color: Color(0xff09D178),
                    ),
                    flagUserCursus
                        ? Expanded(
                            child: TabBarView(children: [
                              About(),
                              Projects(),
                              About(),
                            ]),
                          )
                        : Container(),
                  ],
                ))));
  }
}

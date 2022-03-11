import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/ImageFutureBuilder.dart';
import 'package:swifty_companion/authCodeProvider.dart';
import 'package:swifty_companion/profile.dart';
import 'package:http/http.dart' as http;

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    double contextWidth = MediaQuery.of(context).size.width;
    double contextheight = MediaQuery.of(context).size.height;

    final res = Provider.of<AuthCode>(context, listen: false).getData;
    var user = json.decode(res.body);
    var img = user["image_url"];

    return Container(
      //  width: contextWidth * 0.8,
      height: contextheight * 0.7,
      padding: EdgeInsets.only(top: contextheight * 0.04, left: 20, right: 20),
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Material(
                color: Colors.transparent,
                child: InkWell(
                    focusColor: Colors.transparent,
                    splashColor: Color(0xff09D178),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.topLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ImageGetter(img: img),
                          Container(
                            padding: EdgeInsets.only(left: 25),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  user["usual_full_name"],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )),
                          )
                        ],
                      ),
                    )));
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
                thickness: 0.5,
                //  indent: 20,
                //endIndent: 20,
                color: Color(0xff09D178),
              ),
          itemCount: 1),
    );
  }
}

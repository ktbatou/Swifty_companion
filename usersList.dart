import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/authCodeProvider.dart';
import 'package:swifty_companion/profile.dart';

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
                          CachedNetworkImage(
                            imageUrl: img,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) {
                              print("this is an error ========= $error");
                              return const Image(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQW984UjnFiyu90Wdrtebh_QaUVShVaqjiT7Qs1t3r8nXBZgQE6UstBuAon5J-ZAWFRuns&usqp=CAU"));
                            },
                            imageBuilder: (context, imageProvider) => Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                color: Colors.grey,
                                image:
                                    //chack image with a func that return either true of false
                                    //show img or a user png
                                    DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fitHeight),
                              ),
                            ),
                          ),
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

import 'package:flutter/material.dart';

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
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.topLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 25),
                            child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "kaoutar tbatou",
                                  style: TextStyle(
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
          itemCount: 3),
    );
  }
}

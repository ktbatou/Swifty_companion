import 'package:flutter/material.dart';
import 'package:swifty_companion/aboutObjs.dart';

class AboutList extends StatefulWidget {
  const AboutList({Key? key}) : super(key: key);

  @override
  _AboutListState createState() => _AboutListState();
}

class _AboutListState extends State<AboutList> {
  @override
  Widget build(BuildContext context) {
    double contextWidth = MediaQuery.of(context).size.width;
    double contextheight = MediaQuery.of(context).size.height;
    List<AboutObjs> objs = aboutObj();
    return Container(
        height: contextheight * 0.5,
        padding: EdgeInsets.only(left: 30, top: 10),
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /* Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.grey,
                      ),
                    ),*/
                    objs[index].icon,
                    Container(
                      padding: EdgeInsets.only(left: 25),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "${objs[index].key} :  ${objs[index].value}",
                            style: TextStyle(color: Colors.white, fontSize: 12),
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
            itemCount: 7));
  }
}

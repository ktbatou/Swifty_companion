import 'package:flutter/material.dart';
import 'package:swifty_companion/aboutList.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.grey,
              ),
            ),
            Container(
              // width: 100,
              padding: EdgeInsets.only(left: 20),
              child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "kaoutar tbatou",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
            ),
          ],
        ),
        const Divider(
          thickness: 0.5,
          //  indent: 20,
          //endIndent: 20,
          color: Color(0xff09D178),
        ),
        AboutList()
        /*Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Text(
              "available",
              style: TextStyle(color: Colors.white),
            )),*/
      ],
    ));
  }
}

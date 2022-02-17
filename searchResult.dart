import 'package:flutter/material.dart';
import 'package:swifty_companion/search.dart';
import 'package:swifty_companion/usersList.dart';

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    double contextheight = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/backgound.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Center(
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Search()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Color(0xff09D178),
                ),
              ),
            )),
        backgroundColor: Colors.black.withOpacity(0.75),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // height: contextheight * 0.1,
              Text("Search result",
                  style: TextStyle(fontSize: 24, color: Colors.white)),
              UsersList(),
              SizedBox(
                height: contextheight * 0.05,
              )
            ],
          ),
        ),
      ),
    );
  }
}

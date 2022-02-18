import 'package:flutter/material.dart';
import 'package:swifty_companion/about.dart';
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
                    MaterialPageRoute(builder: (context) => SearchResult()),
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
          backgroundColor: Colors.black.withOpacity(0.65),
          body: TabBarView(
              children: [About(), Tab(child: About()), Tab(child: About())]),
        ),
      ),
    );
  }
}

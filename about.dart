import 'package:flutter/material.dart';
import 'package:swifty_companion/aboutList.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return const AboutList();
  }
}

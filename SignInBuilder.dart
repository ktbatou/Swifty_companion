import 'package:flutter/material.dart';
import 'package:swifty_companion/Oauth2.dart';
import 'package:swifty_companion/search.dart';

class SignInBuilder extends StatefulWidget {
  @override
  _SignInBuilderState createState() => _SignInBuilderState();
}

class _SignInBuilderState extends State<SignInBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: createClient(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Search()),
              (Route<dynamic> route) => false,
            );
            return Container();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return Container();
        });
  }
}

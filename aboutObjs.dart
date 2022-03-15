import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/CursusProvider.dart';
import 'package:swifty_companion/authCodeProvider.dart';

class AboutObjs {
  Icon icon;
  String key;
  String value;
  AboutObjs({required this.icon, this.key = "", this.value = ""});
}

List<AboutObjs> aboutObj(var context) {
  final res = Provider.of<AuthCode>(context, listen: false).getData;
  var value = Provider.of<CursusProvider>(context).getCursus;
  var user = json.decode(res.body);
  //print(user["cursus_users"][2]["user"]["level"]);
  List<AboutObjs> objs = [
    AboutObjs(
        icon: const Icon(
          Icons.laptop,
          color: Colors.white,
        ),
        key: "Available",
        value: user["location"].toString()),
    AboutObjs(
        icon: const Icon(
          Icons.equalizer,
          color: Colors.white,
        ),
        key: "Level",
        value: user["cursus_users"].length == 0
            ? "-"
            : user["cursus_users"][value]["level"].toString()),
    AboutObjs(
        icon: const Icon(
          Icons.phone,
          color: Colors.white,
        ),
        key: "Phone",
        value: user["phone"].toString()),
    AboutObjs(
        icon: const Icon(
          Icons.account_balance_wallet,
          color: Colors.white,
        ),
        key: "Wallet",
        value: user["wallet"].toString()),
    AboutObjs(
        icon: const Icon(
          Icons.email,
          color: Colors.white,
        ),
        key: "Email",
        value: user["email"].toString()),
    AboutObjs(
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
        key: "Points",
        value: user["correction_point"].toString()),
    AboutObjs(
        icon: const Icon(
          Icons.location_on,
          color: Colors.white,
        ),
        key: "Location",
        value: "${user["campus"][0]["city"]},  ${user["campus"][0]["country"]}")
  ];
  return objs;
}

import 'package:flutter/material.dart';

class AboutObjs {
  Icon icon;
  String key;
  String value;
  AboutObjs({required this.icon, this.key = "", this.value = ""});
}

List<AboutObjs> aboutObj() {
  List<AboutObjs> objs = [
    AboutObjs(
        icon: const Icon(
          Icons.laptop,
          color: Colors.white,
        ),
        key: "Available",
        value: "E1R11P3"),
    AboutObjs(
        icon: const Icon(
          Icons.equalizer,
          color: Colors.white,
        ),
        key: "Level",
        value: "13.26"),
    AboutObjs(
        icon: const Icon(
          Icons.phone,
          color: Colors.white,
        ),
        key: "Phone",
        value: "+2125479413"),
    AboutObjs(
        icon: const Icon(
          Icons.account_balance_wallet,
          color: Colors.white,
        ),
        key: "Wallet",
        value: "250"),
    AboutObjs(
        icon: const Icon(
          Icons.email,
          color: Colors.white,
        ),
        key: "Email",
        value: "tbatoukaoutar@gmail.com"),
    AboutObjs(
        icon: const Icon(
          Icons.equalizer,
          color: Colors.white,
        ),
        key: "Points",
        value: "1"),
    AboutObjs(
        icon: const Icon(
          Icons.location_on,
          color: Colors.white,
        ),
        key: "Location",
        value: "Morocco, Khouribga")
  ];
  return objs;
}
